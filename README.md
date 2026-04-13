🚀 Terraform Capstone — Highly Available Web App on AWS

A Terraform project that deploys a highly available static website on AWS using VPC, EC2, and ALB with a modular and production-like structure.

🎯 Architecture
1 VPC (10.0.0.0/16)
3 Public Subnets (Multi-AZ)
3 EC2 instances (NGINX)
1 Application Load Balancer (ALB)
⚙️ Features
Multi-AZ deployment (High Availability)
Load balancing using ALB
Automated NGINX setup (user-data)
Terraform modular design
Remote state (S3 + optional locking)
Infrastructure as Code (IaC)
📁 Project Structure
main.tf
variables.tf
outputs.tf
terraform.tfvars
userdata.sh

modules/
 ├── vpc-module
 ├── ec2-module
 └── alb-module

bootstrap/
.github/workflows/
🔧 Prerequisites
AWS account
Terraform >= 1.0
AWS CLI configured
SSH key pair
S3 bucket for state
🚀 Deployment
terraform init
terraform plan
terraform apply
🌐 Access App

After apply, open:

http://<ALB-DNS-NAME>
🧹 Destroy
terraform destroy
🔒 Security
SSH via key pair
Security groups control access
ALB handles traffic distribution
📊 Outputs
ALB DNS Name
EC2 Public IPs
VPC ID
Subnets
🧠 Summary

This project demonstrates:

Real AWS architecture
Terraform best practices
Modular Infrastructure design
High Availability setup
