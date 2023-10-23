provider "aws" {
  region     = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "tf-project-2023"
    key    = "test/development/infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
  required_version = ">= 0.13"
}
