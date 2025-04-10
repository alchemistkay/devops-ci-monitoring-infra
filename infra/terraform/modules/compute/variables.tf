variable ami_id {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable instance_type {
  type        = string
  default     = "t3.medium"
  description = "ec2 instance type"
}

variable key_name {
  default = ""
  description = "SSH key pair name"
}

variable vpc_id {
  type        = string
  description = "vpc id"
}

variable public_subnet_id {
  type        = string
  description = "Public subnet ID"
}




