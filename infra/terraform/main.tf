# vpc module
module "network" {
    source = "./modules/network"

    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    azs = var.availability_zones
}

# Jenkins EC2 Instance
module "jenkins" {
    source = "./modules/compute"

    vpc_id = module.network.vpc_id
    public_subnet_id = module.network.public_subnet_ids[0]
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
}