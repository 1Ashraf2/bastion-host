resource "aws_subnet" "public_subnet" {
  count             = var.az_limit
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = element(var.public_subnet_cidr, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags = {
    Name = "Test-Pub-Subs"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags   = {
    Name = "Test-Internet-Gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  count   = var.az_limit
  vpc_id  = aws_vpc.vpc.id

  tags  = {
    Name  = "Test-public-RT"
  }
}

resource "aws_route" "public_internet_route" {
  count                  = var.az_limit
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = element(aws_internet_gateway.internet_gateway.*.id, count.index)
  route_table_id         = element(aws_route_table.public_route_table.*.id, count.index)
}

resource "aws_route_table_association" "internet_gateway_public_route" {
  count          = var.az_limit
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.public_route_table.*.id, count.index)
}
