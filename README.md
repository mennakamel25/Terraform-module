#  Terraform AWS Modular Infrastructure Project

This project provisions a **highly available AWS infrastructure** using Terraform with a modular and production-ready design approach.

It demonstrates **Infrastructure as Code (IaC)** best practices, including modularization, remote state management, validation, and a clean repository structure.

---

##  Architecture Overview

- **VPC**: `10.0.0.0/16`
- **Subnets**: 3 Public Subnets across multiple Availability Zones
- **Compute**: EC2 instances for application hosting
- **Load Balancer**: Application Load Balancer (ALB) for traffic distribution

---

## Modules Structure

```bash
modules/
├── vpc/   # Network layer (VPC, subnets, routing)
├── ec2/   # Compute layer (EC2 instances)
└── alb/   # Load balancing layer (ALB, target groups)
