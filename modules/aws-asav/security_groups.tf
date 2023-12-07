resource "aws_security_group" "mgmt_interface_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-mgmt-interface-sg"
  description = "${var.asa_hostname} Management Interface SG"

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
    Name = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-mgmt-sg"
  }
}

resource "aws_security_group" "outside_interface_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-outside-interface-sg"
  description = "${var.asa_hostname} Outside Interface SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # this is a firewall's outside interface, CSB!
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-outside-sg"
  }
}

resource "aws_security_group" "inside_interface_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-inside-interface-sg"
  description = "${var.asa_hostname} Inside Interface SG"

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
    Name = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-inside-sg"
  }
}

resource "aws_security_group" "dmz_interface_security_group" {
  count       = var.dmz_subnet == null ? 0 : 1
  vpc_id      = var.vpc_id
  name        = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-dmz-interface-sg"
  description = "${var.asa_hostname} DMZ Interface SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-dmz-sg"
  }
}
