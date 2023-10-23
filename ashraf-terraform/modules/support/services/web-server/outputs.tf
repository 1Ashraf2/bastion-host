output "web_security_group_id" {
  value = aws_security_group.allow_http.id
}

output "web_sg_name" {
  value  = aws_security_group.allow_http.name
}

output "subnet_ids" {
  value = data.terraform_statefile.development_infrastructure.outputs.private_subnet_ids
}

output "instance_type_web" {
  value = aws_launch_configuration.web_server.id
}

output "web_auto_sg_id" {
  value = aws_autoscaling_group.autoscaling_group.id
}

output "alb_dns_name" {
  value       = aws_lb.app_lb.dns_name
  description = "The domain name of the load balancer"
}

output "alb_name" {
  value = aws_lb.app_lb.name
}

output "web_target" {
  value = aws_lb_target_group.app_lb.arn
}