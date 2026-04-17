🚀 Terraform AWS Modular Infrastructure Project

This project provisions a highly available AWS infrastructure using Terraform with a modular and production-ready design approach.

It demonstrates Infrastructure as Code (IaC) best practices, including modularization, remote state management, validation, and clean repository structure.

🏗️ Architecture Overview
VPC (10.0.0.0/16)
3 Public Subnets across multiple Availability Zones
EC2 Instances (Application hosting)
Application Load Balancer (ALB) for traffic distribution
📦 Modules Structure
modules/
├── vpc/   → Network layer (VPC, subnets, routing)
├── ec2/   → Compute layer (EC2 instances)
└── alb/   → Load balancing layer (ALB, target groups)
⚙️ Features
Modular Terraform architecture
Multi-AZ deployment for high availability
Application Load Balancer for traffic management
EC2-based application hosting
Input validation for safer deployments
Remote state management using S3
Secure repository structure with .gitignore
🚀 Getting Started
1. Clone the repository
git clone <your-repo-url>
cd <repo-name>
2. Initialize Terraform
terraform init
3. Validate configuration
terraform validate
4. Plan deployment
terraform plan
5. Apply infrastructure
terraform apply
🌐 Access Application
http://<ALB-DNS-NAME>
🧹 Destroy Infrastructure
terraform destroy
🧠 Summary

This project demonstrates:

Real AWS infrastructure design
Modular Terraform architecture
High Availability across multiple AZs
Clean DevOps practices (validation, state management, repo hygiene)
Production-like cloud setup
