output "bastion_instance_id" {
  value = aws_instance.cdo-labs-bastion.id
}

output "bastion_sg" {
  value = aws_security_group.cdo-labs-bastion-sg.id
}

output "bastion_ip" {
  value = aws_instance.cdo-labs-bastion.public_ip
}

output "bastion_private_key" {
  value = tls_private_key.rsa_keypair.private_key_pem
}

output "keypair_name" {
  value = one(aws_key_pair.rsa_keypair[*].key_name)
}