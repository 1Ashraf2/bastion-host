resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration      = aws_launch_configuration.web_server.name
  max_size                  = 8
  min_size                  = 2
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  target_group_arns         = [aws_lb_target_group.app_lb.arn]
  vpc_zone_identifier       = split(",",data.terraform_statefile.development_infrastructure.outputs.private_subnet_ids)
}

resource "aws_autoscaling_attachment" "web_server" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.id
  lb_target_group_arn    = aws_lb_target_group.app_lb.arn
}
