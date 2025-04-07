variable "aws_region" {
  type    = string
}

variable "backend_organization" {
  type    = string
}

variable "backend_worspace" {
  type    = string
}

# vpc name variable
variable vpc_name {
  description = "Name of the VPC"
  type = string
}

variable vpc_cidr {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}