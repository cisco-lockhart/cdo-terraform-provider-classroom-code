resource "tls_private_key" "rsa_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "rsa_keypair" {
  count      = var.ssh_key_name == null ? 1 : 0
  key_name   = "${var.classroom_namespace}-bastion-rsa-keypair"
  public_key = tls_private_key.rsa_keypair.public_key_openssh
}
