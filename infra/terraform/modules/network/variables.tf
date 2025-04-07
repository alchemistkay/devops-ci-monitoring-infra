# vpc cidr variable
variable vpc_cidr {
  description = "CIDR block for the VPC"
  type = string
}

# vpc name variable
variable vpc_name {
  description = "Name of the VPC"
  type = string
}

# Public Subnet variable
variable "public_subnet_cidrs" {
    type = list(string)
    description = "k4scloud Public Subnet CIDR values"
}
 
# private Subnet variable
variable "private_subnet_cidrs" {
    type = list(string)
    description = "k4scloud Private Subnet CIDR values"
}

# avaiability zone variable
variable "azs" {
    type = list(string)
    description = "Availability Zones"
}