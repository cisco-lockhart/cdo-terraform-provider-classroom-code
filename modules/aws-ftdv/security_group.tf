resource "aws_security_group" "mgmt_interface_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.ftd_hostname}-mgmt-interface-sg"
  description = "Management Interface SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.bastion_sg]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.base_name}-${var.ftd_hostname}-ftdv-sg"
  }
}

resource "aws_security_group" "outside_interface_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.ftd_hostname}-outside-interface-sg"
  description = "Outside Interface SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # should only need port 443
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.base_name}-${var.ftd_hostname}-ftdv-sg"
  }
}

resource "aws_security_group" "inside_interface_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.ftd_hostname}-inside-interface-sg"
  description = "Inside Interface SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.base_name}-${var.ftd_hostname}-ftdv-sg"
  }
}

resource "aws_security_group" "dmz_interface_security_group" {
  count       = var.dmz_subnet != null ? 1 : 0
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.ftd_hostname}-dmz-interface-sg"
  description = "DMZ Interface SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.base_name}-${var.ftd_hostname}-ftdv-sg"
  }
}
