##############################################################
# VPC Module - variables.tf
##############################################################

variable "vpc_cidr" {
  type        = string 
  description = "The CIDR block for the VPC (e.g., 10.0.0.0/16)"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC and all associated resources"
}

variable "public_subnet_count" {
  type        = number
  description = "Number of public subnets to create (each in a different AZ)"
  default     = 3

  validation {
    condition     = var.public_subnet_count >= 1 && var.public_subnet_count <= 6
    error_message = "public_subnet_count must be between 1 and 6."
  }
}

variable "private_subnet_count" {
  type        = number
  description = "Number of private subnets to create (each in a different AZ)"
  default     = 0

  validation {
    condition     = var.private_subnet_count >= 0 && var.private_subnet_count <= 6
    error_message = "private_subnet_count must be between 0 and 6."
  }
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ports to open in the security group inbound rules (e.g., [80, 443, 22])"
  default     = [80, 443, 22]

  validation {
    condition     = length(var.ingress_ports) > 0
    error_message = "ingress_ports must contain at least one port."
  }
}
