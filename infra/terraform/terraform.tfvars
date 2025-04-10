# AWS Region
aws_region = "eu-west-2"

vpc_name = "k4scloud-vpc"

# VPC CIDR Block
vpc_cidr = "10.0.0.0/16"

# Public Subnet CIDRs (One per Availability Zone)
public_subnet_cidrs = ["10.0.1.0/24", "10.0.3.0/24"]

# Private Subnet CIDRs 
private_subnet_cidrs = ["10.0.2.0/24", "10.0.4.0/24"]

# Availability Zones
availability_zones = ["eu-west-2a", "eu-west-2b"]

# EC2 Instance Details
ami_id         = "ami-04da26f654d3383cf"  # Example Amazon Linux AMI
instance_type  = "t3.medium"
key_name       = "k4scloud-ec2-keypair-1"  # Ensure this key exists in AWS

# Security Group Ingress CIDRs (Restrict to trusted IPs for security)
allowed_ssh_cidr = "0.0.0.0/0"    # Replace with your public IP or VPN CIDR
allowed_http_cidr = "0.0.0.0/0"

# Terraform Backend Configuration (For Terraform Cloud)
backend_organization = "k4scloud"
backend_worspace    = "jenkins-infra"