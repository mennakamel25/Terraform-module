##############################################################
# main-project/variables.tf
##############################################################

variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Base name used to prefix all resources"
  default     = "gotto-job"
}

variable "vpc_name" {
  type        = string
  description = "Name for the VPC"
  default     = "gotto-job-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  type        = number
  description = "Number of public subnets (and AZs) to spread across"
  default     = 3
}

variable "ingress_ports" {
  type        = list(number)
  description = "Ports to open in the security group"
  default     = [80, 443, 22]
}

variable "ec2_instance_count" {
  type        = number
  description = "Number of EC2 instances to launch (one per AZ for HA)"
  default     = 3
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair to use for EC2 instances"
}



