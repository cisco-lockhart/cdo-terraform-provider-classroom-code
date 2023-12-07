module "common_tags" {
  source = "../tags"
}

resource "aws_instance" "cdo-labs-bastion" {
  instance_type               = var.bastion_instance_type
  ami                         = data.aws_ami.default_cisco_hardened_ami.id
  vpc_security_group_ids      = [aws_security_group.cdo-labs-bastion-sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name == null ? aws_key_pair.rsa_keypair[0].id : var.ssh_key_name
  iam_instance_profile        = aws_iam_instance_profile.bastion-iam-profile.id
  tags = merge(module.common_tags.required_tags, {
    Name : "${var.classroom_namespace}-bastion",
    instanceType : "bastion",
    Service : "lab"
  })
}
