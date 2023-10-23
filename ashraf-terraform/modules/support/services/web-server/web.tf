resource "aws_launch_configuration" "web_server" {
  instance_type   = var.ec2_instance
  #key_name       = "ashraf-test-key"
  name            = "Apache-Server"
  security_groups = [aws_security_group.allow_http.id]

  user_data = <<-EOF
   !/bin/bash
   echo "*** Installing apache2"
   sudo apt install apache2 -y
   sudo apt update -y
   sudo apt enable apache2
   echo "*** Completed Installing apache2"
   echo "<html><body><div>Welcome to My Test Project!</div></body></html>" > | sudo tee /var/www/html/index.html
EOF
  image_id  = var.aws_ami
}

resource "aws_security_group" "allow_http" {
  vpc_id = data.terraform_statefile.development_infrastructure.outputs.vpc_id

  ingress {
    description = "http"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-Server-SG"
  }
}
