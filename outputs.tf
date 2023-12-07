output "bastion_public_ip" {
  value = module.bastion.bastion_ip
}

output "bastion_private_key" {
  value     = module.bastion.bastion_private_key
  sensitive = true
}
