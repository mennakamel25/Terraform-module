🚀 Terraform Capstone — Highly Available Web App on AWS

A Terraform project that deploys a highly available static website on AWS using VPC, EC2, and ALB with a modular and production-like structure.
##########################################################################
🎯 Architecture
1 VPC → 10.0.0.0/16
3 Public Subnets (Multi-AZ)
3 EC2 Instances running NGINX
1 Application Load Balancer (ALB)
⚙️ Features
Multi-AZ deployment (High Availability)
Load balancing using ALB
Automated NGINX setup (user-data script)
Modular Terraform design
Remote state (S3 + optional locking)
Infrastructure as Code (IaC)
###########################################################
📁 Project Structure
main.tf
variables.tf
outputs.tf
terraform.tfvars
userdata.sh
##########################################################
modules/
├── vpc-module
├── ec2-module
└── alb-module

#############################################
🔧 Prerequisites
AWS Account
Terraform >= 1.0
AWS CLI configured
SSH Key Pair
S3 Bucket for Terraform state
🚀 Deployment
terraform init

terraform plan

terraform apply
🌐 Access Application

After deployment, open:

http://<ALB-DNS-NAME>
🧹 Destroy Infrastructure
terraform destroy
🔒 Security
SSH access via key pair only
Security Groups control inbound traffic
ALB handles traffic distribution
📊 Outputs
ALB DNS Name
EC2 Public IPs
VPC ID
Subnet IDs
🧠 Summary

This project demonstrates:

Real AWS production-like architecture
Terraform best practices
Modular infrastructure design
High Availability setup across multiple AZs
