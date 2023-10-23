resource "aws_launch_configuration" "bastion_host" {
  name                        = "bastion-host"
  image_id                    = var.aws_ami
  instance_type               = var.ec2_instance
  key_name                    = "ashraf-test-key"
  security_groups             = [aws_security_group.allow_ssh.id, aws_security_group.bastion_ssh.id]

  user_data = <<-EOF
   !/bin/bash
   sudo yum update -y
EOF
}

resource "aws_security_group" "allow_ssh" {
  vpc_id  = data.terraform_statefile.development_infrastructure.outputs.vpc_id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags     = {
    Name   = "Test-bastion-sg"
  }
}

