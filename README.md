🚀 Terraform Capstone — AWS Static Website

This project provisions a highly available static website on AWS using Terraform.

📌 What It Does
Creates a VPC
Launches 3 EC2 instances with NGINX
Configures an Application Load Balancer
Uses S3 + DynamoDB for remote Terraform state
🏗️ Architecture
Internet → ALB → EC2 (3 instances across AZs) → VPC
⚙️ Prerequisites
AWS account
EC2 Key Pair
🪣 Backend Configuration

Edit main.tf:

terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-lock-table"
    encrypt        = true
  }
}

⚠️ Create the S3 bucket and DynamoDB table before running Terraform.

🚀 Deploy
terraform init
terraform apply
💣 Destroy
terraform destroy
📁 Structure
main.tf
variables.tf
outputs.tf
terraform.tfvars
userdata.sh
👩‍💻 Author

Menna Kamel
DevOps Engineer 🚀
