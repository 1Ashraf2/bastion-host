variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block which has been allocated to this VPC"
  default     = "172.31.0.0/16"
}

variable "auto_accept" {
  description = "Auto accept connections?"
  default     = "true"
}

variable "az_limit" {
  description = "The number of availability zones to use"
  default     = 2
}

variable "name" {
  default = "test"
}
