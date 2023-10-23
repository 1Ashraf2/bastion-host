variable "aws_ami" {
  type    = string
  default = "ami-0fc5d935ebf8bc3bc"
}
variable "ec2_instance" {
  type = string
  default = "t2.micro"
}

variable "private_subnet" {
  type = string
}

variable "name" {
  type = string
}

variable "server_port" {
  type        = number
}

variable "elb_port" {
  type        = number
}

variable "s3_bucket" {
  default = "tf-project-2023"
}
variable "http_port" {
  default = "80"
}