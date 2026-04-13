# Terraform Capstone — Highly Available Static Website on AWS

Deploys 3 NGINX EC2 instances across 3 AZs behind an Application Load Balancer,
serving the "Gotto Job" static website. Fully automated with a DevSecOps GitHub Actions pipeline.

---

## Architecture

```
Internet → ALB (internet-facing)
               ↓
    ┌──────────┼──────────┐
    │          │          │
  EC2-1      EC2-2      EC2-3
  (AZ-a)    (AZ-b)    (AZ-c)
    └──────────┴──────────┘
          VPC 10.0.0.0/16
```

---

## Prerequisites

1. AWS account with IAM credentials (access key + secret key)
2. An EC2 key pair created in your target region
3. Three GitHub repositories published (VPC, EC2, ALB modules)
4. GitHub repository secrets configured:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

---

## Step 1 — Bootstrap the Remote State Backend

```bash
cd bootstrap/

# Edit terraform.tfvars with your unique bucket name
vim terraform.tfvars

terraform init
terraform apply
# Note the outputs: state_bucket_name and lock_table_name
```

---

## Step 2 — Update Backend Config in main.tf

Edit `main.tf` and replace the backend block with your actual values:

```hcl
backend "s3" {
  bucket         = "<state_bucket_name from bootstrap output>"
  key            = "terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "<lock_table_name from bootstrap output>"
  encrypt        = true
}
```

---

## Step 3 — Update Module Sources in main.tf

Replace the placeholder GitHub URLs with your actual repos:

```hcl
module "vpc" {
  source = "github.com/<YOUR_USERNAME>/VPC-Module-<yourname>"
  ...
}
module "ec2" {
  source = "github.com/<YOUR_USERNAME>/EC2-Module-<yourname>"
  ...
}
module "alb" {
  source = "github.com/<YOUR_USERNAME>/ALB-Module-<yourname>"
  ...
}
```

---

## Step 4 — Update terraform.tfvars

```hcl
key_name = "your-actual-key-pair-name"
```

---

## Step 5 — Deploy via GitHub Actions

1. Push all files to your GitHub repository.
2. Go to **Actions** → **Terraform DevSecOps Pipeline** → **Run workflow**.
3. Select **apply** and click **Run workflow**.
4. Watch the 3 jobs run: `plan` → `security_scan` → `execute`.
5. Copy the ALB DNS name from the `execute` job output and open it in your browser.

---

## Step 6 — Destroy via GitHub Actions

1. Go to **Actions** → **Terraform DevSecOps Pipeline** → **Run workflow**.
2. Select **destroy** and click **Run workflow**.
3. Watch `plan` → `execute` run (`security_scan` is skipped for destroy).

---

## Local Testing (optional)

```bash
# Initialize
terraform init

# Plan
terraform plan

# Apply
terraform apply

# Destroy
terraform destroy
```

---

## Project Structure

```
.
├── main.tf                          # Root module consuming VPC/EC2/ALB modules
├── variables.tf                     # Input variables
├── outputs.tf                       # Outputs (ALB DNS name, IPs, etc.)
├── terraform.tfvars                 # Your variable values
├── userdata.sh                      # NGINX + Gotto Job install script
├── bootstrap/
│   ├── main.tf                      # S3 bucket + DynamoDB table
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
└── .github/
    └── workflows/
        └── terraform.yml            # GitHub Actions DevSecOps pipeline
```

---

## Security Scan Reports

After each `apply` pipeline run, download the scan reports from **Actions → your run → Artifacts**:

- `tfsec-report` — security misconfigurations
- `checkov-report` — compliance and best practices

Findings are for visibility only and do **not** block the pipeline.
