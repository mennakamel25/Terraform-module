# EC2 Module

A reusable Terraform module that provisions one or more EC2 instances distributed across multiple subnets in a round-robin fashion.

## Features

- Round-robin subnet distribution using `element()`
- Sequential naming: `<ec2_name>-1`, `<ec2_name>-2`, etc.
- Public IP association enabled by default
- Accepts any user_data script for bootstrapping

## Usage

```hcl
module "ec2" {
  source = "github.com/<your-username>/EC2-Module-<yourname>"

  instance_count    = 3
  ami_id            = "ami-0abcdef1234567890"
  instance_type     = "t2.micro"
  key_name          = "my-key-pair"
  subnet_ids        = ["subnet-aaa", "subnet-bbb", "subnet-ccc"]
  security_group_id = "sg-xxxxxxxxxx"
  user_data         = file("userdata.sh")
  ec2_name          = "web-server"
}
```

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `instance_count` | `number` | `1` | Number of instances |
| `ami_id` | `string` | — | AMI ID |
| `instance_type` | `string` | `t2.micro` | Instance type |
| `key_name` | `string` | — | SSH key pair name |
| `subnet_ids` | `list(string)` | — | Subnet IDs for round-robin placement |
| `security_group_id` | `string` | — | Security group ID |
| `user_data` | `string` | `""` | Bootstrap script |
| `ec2_name` | `string` | — | Base name for instances |

## Outputs

| Name | Description |
|---|---|
| `instance_ids` | List of EC2 instance IDs |
| `public_ips` | List of public IP addresses |
| `private_ips` | List of private IP addresses |
