# Security Group for Jenkins EC2
resource "aws_security_group" "ci_stack_sg" {
  name        = "jenkins-security-group"
  description = "Allow SSH and HTTP access for Jenkins"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Consider restricting this for security
  }

  ingress {
    description = "Jenkins UI access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict to trusted IPs for security
  }

  ingress {
    description = "SonarQube UI access"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict to trusted IPs for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Jenkins EC2 Instance
resource "aws_instance" "ci_stack" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_id  # Deploy to the first public subnet
  vpc_security_group_ids = [aws_security_group.ci_stack_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "ci-stack-server"
  }
}