

output "alb_dns_name" {
  description = "Open this URL in your browser to see the Gotto Job website"
  value       = "http://${module.alb.alb_dns_name}"
}

output "vpc_id" {
  description = "ID of the deployed VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "ec2_instance_ids" {
  description = "IDs of the EC2 web servers"
  value       = module.ec2.instance_ids
}

output "ec2_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.public_ips
}

output "alb_id" {
  description = "ID of the Application Load Balancer"
  value       = module.alb.alb_id
}
