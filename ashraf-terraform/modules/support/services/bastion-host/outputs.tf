output "bastion_security_group_id" {
  value = aws_security_group.allow_ssh.id
}

output "bsg_name" {
  value  = aws_security_group.allow_ssh.name
}

output "subnet_id" {
  value = data.terraform_statefile.development_infrastructure.outputs.public_subnet_id
}

output "instance_type_bast" {
  value = aws_launch_configuration.bastion_host
}

output "bast_auto_sg_id" {
  value = aws_autoscaling_group.autoscaling_group.id
}

output "elb_dns_name" {
  value       = aws_lb.bastion_elb.dns_name
  description = "The domain name of the load balancer"
}

output "elb_name" {
  value = aws_lb.bastion_elb.name
}

output "bastion_target" {
  value = aws_lb_target_group.bastion.arn
}
