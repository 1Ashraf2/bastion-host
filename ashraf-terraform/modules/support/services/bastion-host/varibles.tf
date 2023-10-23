variable "aws_ami" {
  type    = string
  default = "ami-0fc5d935ebf8bc3bc"
}
variable "ec2_instance" {
  type = string
}

variable "public_subnet" {
  type = string
}

variable "ssh_port" {
  default = "22"
}

variable "name" {
  type = string
}

variable "s3_bucket" {
  default = "tf-project-2023"
}