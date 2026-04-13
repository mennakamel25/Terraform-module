##############################################################
# EC2 Module - outputs.tf
##############################################################

output "instance_ids" {
  description = "List of created EC2 instance IDs"
  value       = aws_instance.this[*].id
}

output "public_ips" {
  description = "List of public IP addresses of the EC2 instances"
  value       = aws_instance.this[*].public_ip
}

output "private_ips" {
  description = "List of private IP addresses of the EC2 instances"
  value       = aws_instance.this[*].private_ip
}
