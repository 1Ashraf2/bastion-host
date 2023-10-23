variable "environment" {
  description = "The Environment/VPC where this ASG will exist"
  default     = "test"
}

variable "vpc_zone_identifier" {
  description = "List of subnets to launch the instances in"
  default     = "eu-west-1a,eu-west-1b"
}

variable "health_check_type" {
  description = "Type of health check to perform - EC2 or ELB"
  default     = "ELB"
}

variable "health_check_grace_period" {
  description = "Initial healthcheck grace period"
  default     = "300"
}

variable "aws_ami" {
  type    = string
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "ec2_instance" {
  type    = string
  default = "t2.micro"
}
variable "aws_region" {
  description = "AWS region name"
  default     = "eu-west-1"
}

variable "public_subnet" {
  default = "172.31.1.0/24"
}

variable "name" {
  default = "test"
}
