# private subnet - used for mgmt
resource "aws_subnet" "mgmt_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.mgmt_network_cidr

  tags = merge(local.tags, {
    Name = "${var.classroom_namespace}-mgmt-subnet"
  })
  availability_zone = aws_subnet.public_subnet.availability_zone
}

resource "aws_route_table" "mgmt_subnet_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }
}

resource "aws_route_table_association" "mgmt_subnet_route" {
  subnet_id      = aws_subnet.mgmt_subnet.id
  route_table_id = aws_route_table.mgmt_subnet_route.id
}