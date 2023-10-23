resource "aws_lb" "bastion_elb" {
  name                       = "test-bastion-elb"
  subnets                    = split(",",data.terraform_statefile.development_infrastructure.outputs.public_subnet_id)
  internal                   = false
  load_balancer_type         = "network"
  enable_deletion_protection = false

  tags     = {
    Name   = "Bastion-ELB"
  }
}

resource "aws_lb_target_group" "bastion" {
  port                  = var.ssh_port
  protocol              = "TCP"
  vpc_id                = data.terraform_statefile.development_infrastructure.outputs.vpc_id
  deregistration_delay  = "30"
  health_check {
    interval            = "50"
    port                = var.ssh_port
    protocol            = "TCP"
    healthy_threshold   = "10"
    unhealthy_threshold = "10"
  }
}

resource "aws_lb_listener" "ssh" {
  load_balancer_arn     = aws_lb.bastion_elb.arn
  port                  = var.ssh_port
  protocol              = "TCP"

  default_action {
    type = "forward"
    target_group_arn    = aws_lb_target_group.bastion.arn
  }
}

resource "aws_security_group" "bastion_ssh" {
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