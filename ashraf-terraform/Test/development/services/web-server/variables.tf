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

variable "private_subnet" {
  default = "172.31.3.0/24"
}
