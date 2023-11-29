# private subnet - used for inside
resource "aws_subnet" "inside_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.inside_network_cidr

  tags = merge(local.tags, {
    Name = "${var.classroom_namespace}-inside-subnet"
  })
  availability_zone = aws_subnet.public_subnet.availability_zone
}

resource "aws_route_table" "inside_subnet_route" {
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

resource "aws_route_table_association" "inside_subnet_route" {
  subnet_id      = aws_subnet.inside_subnet.id
  route_table_id = aws_route_table.inside_subnet_route.id
}