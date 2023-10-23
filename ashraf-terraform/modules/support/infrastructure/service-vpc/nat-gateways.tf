resource "aws_eip" "nat_gateway_eip" {
  count   = var.az_limit
  vpc     = "true"

  tags    = {
    Name  = "Test-EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  depends_on    = [aws_internet_gateway.internet_gateway]
  allocation_id =  aws_eip.nat_gateway_eip[0].id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags   = {
    Name = "Test-Nat-Gateway"
  }
}
