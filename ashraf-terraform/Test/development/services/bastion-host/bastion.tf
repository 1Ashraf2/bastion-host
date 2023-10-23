module "bastion_ec2" {
  source        = "../../../../modules/support/services/bastion-host"
  aws_ami       = var.aws_ami
  ec2_instance  = var.ec2_instance
  public_subnet = data.terraform_statefile.development_infrastructure.outputs.public_subnet_id
  name          = "bastion"
}
