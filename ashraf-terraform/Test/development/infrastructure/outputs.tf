output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "nat_gateway_ip_address" {
  value = module.vpc.nat_gateway_ip_address
}

output "nat_gateway_ids" {
  value = module.vpc.nat_gateway_ids
}

output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

output "availability_zone" {
  value = module.vpc.availability_zones
}

output "public_route_table_count" {
  value = module.vpc.public_route_table_count
}

output "private_route_table_count" {
  value = module.vpc.private_route_table_count
}

output "eip" {
  value = module.vpc.nat_gateway_ip_address
}
