# Production-Grade AWS HA Web Stack (Terraform)

## Overview
This project provisions a highly available, secure web architecture on AWS using Terraform.

## Architecture
- VPC (10.0.0.0/16)
- 2 Public Subnets (multi-AZ)
- 2 Private Subnets (multi-AZ)
- Internet Gateway (public routing)
- NAT Gateway (private outbound internet)
- Application Load Balancer (internet-facing)
- Target Group with HTTP health checks (/)
- Launch Template (Amazon Linux 2 + user data bootstrapping)
- Auto Scaling Group (min/desired=2, max=4) in private subnets

## Traffic Flow
User -> ALB (public subnets) -> Target Group -> EC2 (private subnets) -> NAT -> Internet

## Security Design
- EC2 instances have no public IPs
- EC2 security group allows HTTP only from ALB security group (SG-to-SG reference)
- Outbound allowed for patching and package installs via NAT
- Instances use user-data for immutable bootstrapping

## High Availability & Self-Healing
- ALB spans multiple AZs
- ASG maintains desired capacity and replaces unhealthy instances automatically
- Health checks ensure only healthy instances receive traffic

## How to Run
terraform init
terraform plan
terraform apply

## Validation
- ALB DNS returns: "Healthy from <hostname>"
- Refreshing page routes across instances (load balancing)
- Terminating an instance triggers ASG replacement (self-healing)

## Cost Notes
- NAT Gateway incurs hourly + data processing charges
- Designed for production patterns; can be optimized for dev environments
