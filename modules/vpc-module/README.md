# VPC Module

A reusable Terraform module that provisions a complete AWS VPC networking layer with public/private subnets, internet gateway, route tables, and a configurable security group.

## Features

- Automatic CIDR calculation using `cidrsubnet()`
- Multi-AZ subnet distribution via `data "aws_availability_zones"`
- Internet Gateway + public route table
- Dynamic security group ingress rules

## Usage

```hcl
module "vpc" {
  source = "github.com/<your-username>/VPC-Module-<yourname>"

  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "my-vpc"
  public_subnet_count  = 3
  private_subnet_count = 0
  ingress_ports        = [80, 443, 22]
}
```

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `vpc_cidr` | `string` | — | VPC CIDR block |
| `vpc_name` | `string` | — | Name tag for all resources |
| `public_subnet_count` | `number` | `3` | Number of public subnets |
| `private_subnet_count` | `number` | `0` | Number of private subnets |
| `ingress_ports` | `list(number)` | `[80, 443, 22]` | Ports to open in the security group |

## Outputs

| Name | Description |
|---|---|
| `vpc_id` | VPC ID |
| `public_subnet_ids` | List of public subnet IDs |
| `private_subnet_ids` | List of private subnet IDs |
| `security_group_id` | Security group ID |
