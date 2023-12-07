output "mgmt_intf_dns_name" {
  description = "The DNS name of the management interface in the private subnet."
  value       = aws_network_interface.ftd_mgmt[0].private_dns_name
}

output "mgmt_intf_private_ip" {
  description = "The private IP of the management interface in the private subnet."
  value       = aws_network_interface.ftd_mgmt[0].private_ip
}

output "public_interface_eip" {
  value       = length(aws_eip.ftdv_outside_eip) > 0 ? aws_eip.ftdv_outside_eip[0].public_ip : null
  description = "The public IP address of the FTDv's outside interface"
}

output "secondary_public_interface_eip" {
  value       = length(aws_eip.ftdv_outside_eip) > 1 ? aws_eip.ftdv_outside_eip[1].public_ip : null
  description = "The second public IP address of the FTDv's outside interface"
}

output "inside_interface_ip" {
  value = aws_network_interface.ftd_inside.private_ip
}

output "dmz_interface_ip" {
  value = length(aws_network_interface.ftd_dmz) > 0 ? aws_network_interface.ftd_dmz[0].private_ip : null
}