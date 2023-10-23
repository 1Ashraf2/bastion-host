resource "aws_subnet" "private_subnet" {
  count             = var.az_limit
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = element(var.private_subnet_cidr, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags   = {
    Name = "Test-pvt-Subs"
  }
}

resource "aws_route_table" "private_route_table" {
  count   = var.az_limit
  vpc_id  = aws_vpc.vpc.id

  tags    = {
    Name  = "Test-pvt-RT"
  }
}

resource "aws_route" "private_route" {
  count                  = var.az_limit
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway.*.id, count.index)
  route_table_id         = element(aws_route_table.private_route_table.*.id, count.index)
}

resource "aws_route_table_association" "private_rt_association" {
  count          = var.az_limit
  route_table_id = element(aws_route_table.private_route_table.*.id, count.index)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
}

