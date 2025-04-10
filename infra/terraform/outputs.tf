# Output EC2 Jenkins Public IP for Ansible
output "ec2_public_ip" {
  value = module.compute.ec2_instance.public_ip 
}