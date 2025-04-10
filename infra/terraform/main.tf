# vpc module
module "network" {
    source = "./modules/network"
}

# Jenkins EC2 Instance
module "compute" {
    source = "./modules/compute"

    vpc_id = module.network.vpc.vpc_id
    public_subnet_id = module.network.vpc.public_subnets[0]
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
}