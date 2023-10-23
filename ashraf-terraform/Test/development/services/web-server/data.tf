data "terraform_statefile" "development_infrastructure" {
  backend = "s3"

  config = {
    bucket = "tf-project-2023"
    key    = "test/development/infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}