resource "aws_lb" "app_lb" {
  name               = "test-web-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  enable_cross_zone_load_balancing = true
  security_groups    = [aws_security_group.allow_http.id]
  subnets            =  split(",",data.terraform_statefile.development_infrastructure.outputs.private_subnet_ids)

  tags = {
    Name = "Application-LB"
  }
}

resource "aws_lb_listener" "app_lb" {
  load_balancer_arn = aws_lb.app_lb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb.arn
  }
}

resource "aws_lb_target_group" "app_lb" {
  port               = 80
  protocol           = "HTTP"
  target_type        = "instance"
  vpc_id             = data.terraform_statefile.development_infrastructure.outputs.vpc_id

    health_check {
      path                = "/"
      port                = var.http_port
      protocol            = "HTTP"
      interval            = 15
      matcher             = "200"
      timeout             = 3
      healthy_threshold   = 3
      unhealthy_threshold = 3
    }
}
