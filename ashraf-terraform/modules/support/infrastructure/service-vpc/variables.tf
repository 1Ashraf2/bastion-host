variable "aws_region" {
  default     = "eu-west-1"
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zone"
  default     = []
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-a"
  default     = []
}

variable "public_subnet_interfix" {
  type        = string
  description = "Give interfix to public subnet name"
  default     = "public"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "Private subnet CIDR within AZ-a"
  default     = []
}


variable "default_route" {
  type        = string
  description = "Default Route from and to internet"
  default     = "0.0.0.0/0"
}

variable "az_limit" {
  description = "The availability zones to deploy to."
  default     = 2
}

variable "vpc_cidr_block" {
  description = "VPC Cidr Block"
}

variable "use_nat_instances" {
  default     = false
}
