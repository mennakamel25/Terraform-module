##############################################################
# EC2 Module - variables.tf
##############################################################

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create"
  default     = 1

  validation {
    condition     = var.instance_count >= 1
    error_message = "instance_count must be at least 1."
  }
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for the instances (e.g., Ubuntu AMI)"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (e.g., t2.micro)"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair to attach to instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to distribute instances across (round-robin)"

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "subnet_ids must contain at least one subnet ID."
  }
}

variable "security_group_id" {
  type        = string
  description = "Security group ID to attach to the instances"
}

variable "user_data" {
  type        = string
  description = "User data (bash script) to run on instance launch"
  default     = ""
}

variable "ec2_name" {
  type        = string
  description = "Base name for EC2 instances (suffixed with index, e.g., web-server-1)"
}
