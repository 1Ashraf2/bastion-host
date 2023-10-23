module "web_ec2" {
  source          = "../../../../modules/support/services/web-server"
  aws_ami         = var.aws_ami
  ec2_instance    = var.ec2_instance
  private_subnet  = data.terraform_statefile.development_infrastructure.outputs.private_subnet_ids
  name            = "web-server"
  elb_port        = 80
  server_port     = 8080
}
