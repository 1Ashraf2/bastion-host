output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}
output "public_subnet_ids" {
  value = join(",", aws_subnet.public_subnet.*.id)
}

output "public_subnet_ids_list" {
  value = aws_subnet.public_subnet.*.id
}

output "public_subnet_cidrs" {
  value = aws_subnet.private_subnet.*.cidr_block
}

output "private_subnet_ids" {
  value = join(",", aws_subnet.private_subnet.*.id)
}

output "private_subnet_ids_list" {
  value = aws_subnet.private_subnet.*.id
}

output "private_subnet_cidrs" {
  value = aws_subnet.private_subnet.*.cidr_block
}
output "nat_gateway_ip_address" {
  value = aws_eip.nat_gateway_eip.*.public_ip
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.nat_gateway.*.id
}

output "nat_gateway_ip_address_list" {
  value = aws_eip.nat_gateway_eip.*.public_ip
}

output "nat_gateway_ids_list" {
  value = aws_nat_gateway.nat_gateway.*.id
}

output "public_route_table_ids" {
  value = join(",", aws_route_table.public_route_table.*.id)
}

output "public_route_table_ids_list" {
  value = aws_route_table.public_route_table.*.id
}

output "private_route_table_ids" {
  value = join(",", aws_route_table.private_route_table.*.id)
}

output "private_route_table_ids_list" {
  value = aws_route_table.private_route_table.*.id
}

output "private_route_table_count" {
  value = var.az_limit
}

output "public_route_table_count" {
  value = "1"
}

output "availability_zones" {
  value = join(",", aws_subnet.private_subnet.*.availability_zone)
}

output "availability_zones_list" {
  value = aws_subnet.private_subnet.*.availability_zone
}
