# ALB Module

A reusable Terraform module that provisions an AWS Application Load Balancer with a target group, health checks, and an HTTP listener.

## Features

- Supports internet-facing or internal ALB
- HTTP listener on port 80 forwarding to target group
- Health check on `/` with configurable thresholds
- Registers any number of EC2 instances as targets

## Usage

```hcl
module "alb" {
  source = "github.com/<your-username>/ALB-Module-<yourname>"

  alb_name          = "my-alb"
  alb_type          = "internet-facing"
  vpc_id            = "vpc-xxxxxxxxxx"
  subnet_ids        = ["subnet-aaa", "subnet-bbb", "subnet-ccc"]
  security_group_id = "sg-xxxxxxxxxx"
  instance_ids      = ["i-aaa", "i-bbb", "i-ccc"]
}
```

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `alb_name` | `string` | — | ALB name (max 32 chars) |
| `alb_type` | `string` | `internet-facing` | `internet-facing` or `internal` |
| `vpc_id` | `string` | — | VPC ID for the target group |
| `subnet_ids` | `list(string)` | — | Subnets for the ALB (min 2) |
| `security_group_id` | `string` | — | Security group ID |
| `instance_ids` | `list(string)` | — | EC2 instance IDs to register |

## Outputs

| Name | Description |
|---|---|
| `alb_id` | ALB ID |
| `alb_dns_name` | Public DNS name (use as site URL) |
| `alb_arn` | ALB ARN |
| `target_group_arn` | Target group ARN |
