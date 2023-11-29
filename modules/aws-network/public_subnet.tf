
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = merge(local.tags, {
    Name = "${var.classroom_namespace}-vpc"
  })
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = merge(local.tags, {
    Name = "${var.classroom_namespace}-public-subnet"
  })
}

resource "aws_subnet" "secondary_public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.253.0/24"

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge(local.tags, {
    Name = "${var.classroom_namespace}-secondary-public-subnet"
  })
}
resource "aws_route_table_association" "public_subnet_route" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet_route.id
}

resource "aws_route_table_association" "secondary_public_subnet_route" {
  subnet_id      = aws_subnet.secondary_public_subnet.id
  route_table_id = aws_route_table.public_subnet_route.id
}

resource "aws_route_table" "public_subnet_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = local.tags
}

resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = local.tags

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_subnet" "common_private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.252.0/24"

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge(local.tags, {
    Name = "${var.classroom_namespace}-public-subnet"
  })
}

resource "aws_route_table" "common_private_subnet_route" {
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


resource "aws_route_table_association" "common_private_subnet_route" {
  subnet_id      = aws_subnet.common_private_subnet.id
  route_table_id = aws_route_table.common_private_subnet_route.id
}


resource "aws_route53_zone" "private" {
  name = "${var.classroom_namespace}.internal"

  vpc {
    vpc_id = aws_vpc.main.id
  }

  tags = local.tags
}

# public route53-zone
data "aws_route53_zone" "public" {
  name = var.root_dns_zone
}
