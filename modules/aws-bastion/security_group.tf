resource "aws_security_group" "cdo-labs-bastion-sg" {
  vpc_id      = var.vpc_id
  name        = "${var.classroom_namespace}-cdo-labs-bastion-sg"
  description = "Security Group that allows all egress and no ingress"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.classroom_namespace}-cdo-labs-bastion-sg"
  }
}

resource "aws_security_group_rule" "allow-inbound-ssh" {
  count             = var.enable_ssh_access ? 1 : 0
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cdo-labs-bastion-sg.id
}