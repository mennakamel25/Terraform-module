terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "route-infra-c3-012345"
    key     = "route/us-east-1/dev/terraform.tfstate"
    region  = "us-east-1"
    
    use_lockfile = true
  }
}

# --------------------------------------------------------------
# AWS Provider
# --------------------------------------------------------------
provider "aws" {
  region = var.aws_region
}

# --------------------------------------------------------------
# AMI
# --------------------------------------------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# --------------------------------------------------------------
# Module: VPC
# --------------------------------------------------------------
module "vpc" {
  source = "./modules/vpc-module"

  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = 0
  ingress_ports        = var.ingress_ports
}

# --------------------------------------------------------------
# Module: EC2
# --------------------------------------------------------------
module "ec2" {
  source = "./modules/ec2-module"

  instance_count    = var.ec2_instance_count
  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id
  user_data         = file("${path.module}/userdata.sh")
  ec2_name          = "${var.project_name}-web"
}

# --------------------------------------------------------------
# Module: ALB
# --------------------------------------------------------------
module "alb" {
  source = "./modules/alb-module"

  alb_name          = "${var.project_name}-alb"
  alb_type          = "internet-facing"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id
  instance_ids      = module.ec2.instance_ids
}