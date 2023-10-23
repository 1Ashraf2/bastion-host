resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration      = aws_launch_configuration.bastion_host.id
  target_group_arns         = [aws_lb_target_group.bastion.arn]
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 60
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier       = split(",", data.terraform_statefile.development_infrastructure.outputs.public_subnet_id)
}
