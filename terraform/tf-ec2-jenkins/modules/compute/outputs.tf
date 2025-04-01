# Output EC2 Public IP for Ansible
output "ec2_instance" {
  value = aws_instance.jenkins
}