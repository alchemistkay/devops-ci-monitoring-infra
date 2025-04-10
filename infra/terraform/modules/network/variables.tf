# vpc cidr variable
variable vpc_cidr {
  default = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

# vpc name variable
variable vpc_name {
  default = "k4scloud-vpc"
  description = "Name of the VPC"
}

# Public Subnet variable
variable "public_subnet_cidrs" {
    default = ["10.0.101.0/24", "10.0.102.0/24"]
    description = "k4scloud Public Subnet CIDR values"
}
 
# private Subnet variable
variable "private_subnet_cidrs" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    description = "k4scloud Private Subnet CIDR values"
}

# avaiability zone variable
variable "azs" {
    default = ["eu-west-2a", "eu-west-2b"]
    description = "Availability Zones"
}