# vpc
resource "aws_vpc" "k4scloud-vpc" {
    cidr_block = var.vpc_cidr 
    enable_dns_hostnames = true
    enable_dns_support = true
    enable_network_address_usage_metrics = true
    lifecycle {
        prevent_destroy = false
    }
 
    tags = {
        Name = var.vpc_name
    }
}

# public subnet resources
resource "aws_subnet" "public_subnets" {
    count      = length(var.public_subnet_cidrs)
    vpc_id     = aws_vpc.k4scloud-vpc.id
    cidr_block = element(var.public_subnet_cidrs, count.index)
    availability_zone = element(var.azs, count.index)
    # DNS and public 
    #  enable_dns64 = true
    enable_resource_name_dns_a_record_on_launch = true
    #  enable_resource_name_dns_aaaa_record_on_launch = true
    map_public_ip_on_launch = true
    
    tags = {
        Name = "k4scloud Public Subnet ${count.index + 1}"
    }

    lifecycle {
        prevent_destroy = false
    }
}

# private subnet resources
resource "aws_subnet" "private_subnets" {
    count      = length(var.private_subnet_cidrs)
    vpc_id     = aws_vpc.k4scloud-vpc.id
    cidr_block = element(var.private_subnet_cidrs, count.index)
    availability_zone = element(var.azs, count.index)
    
    tags = {
        Name = "k4scloud Private Subnet ${count.index + 1}"
    }
    lifecycle {
        prevent_destroy = false
    }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.k4scloud-vpc.id
    
    tags = {
        Name = "k4scloud VPC Internet Gateway"
    }
}

# 2 aws route table route
resource "aws_route_table" "second_rt" {
    vpc_id = aws_vpc.k4scloud-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    
    tags = {
        Name = "2nd Route Table"
    }
}

# Associate Public Subnets with the Second Route Table
resource "aws_route_table_association" "public_subnet_asso" {
    count = length(var.public_subnet_cidrs)
    subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
    route_table_id = aws_route_table.second_rt.id
 
}