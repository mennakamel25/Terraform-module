##############################################################
# ALB Module - variables.tf
##############################################################

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"

  validation {
    condition     = length(var.alb_name) <= 32
    error_message = "alb_name must be 32 characters or fewer."
  }
}

variable "alb_type" {
  type        = string
  description = "Load balancer scheme: 'internet-facing' or 'internal'"
  default     = "internet-facing"

  validation {
    condition     = contains(["internet-facing", "internal"], var.alb_type)
    error_message = "alb_type must be either 'internet-facing' or 'internal'."
  }
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the target group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to place the ALB in (minimum 2 for HA)"

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "subnet_ids must contain at least 2 subnets for the ALB."
  }
}

variable "security_group_id" {
  type        = string
  description = "Security group ID to attach to the ALB"
}

variable "instance_ids" {
  type        = list(string)
  description = "List of EC2 instance IDs to register as targets in the target group"

  validation {
    condition     = length(var.instance_ids) > 0
    error_message = "instance_ids must contain at least one instance ID."
  }
}
