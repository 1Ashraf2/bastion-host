module "vpc" {
  source              = "../../../modules/support/infrastructure/service-vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = ["172.31.1.0/24", "172.31.2.0/24"]
  private_subnet_cidr = ["172.31.3.0/24", "172.31.4.0/24"]
  availability_zone   = []
  az_limit            = var.az_limit
}

