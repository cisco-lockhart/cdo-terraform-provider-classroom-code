output "mgmt_interface_ip" {
  value       = aws_network_interface.asa_mgmt.private_ip
  description = "The IP Address of the Management Interface of the ASA."
}

output "inside_interface_ip" {
  value       = aws_network_interface.asa_inside.private_ip
  description = "The IP address of the inside interface of the ASA."
}

output "dmz_interface_ip" {
  value       = length(aws_network_interface.asa_dmz) > 0 ? aws_network_interface.asa_dmz[0].private_ip : null
  description = "The IP address of the DMZ interface of the ASA."
}

output "public_interface_eip" {
  value       = var.assign_eip_to_outside ? aws_eip.asa_outside_eip[0].public_ip : null
  description = "The public IP address of the ASAv's outside interface"
}

# This is provided as an output so that if the mgmt interface is public,
# you can assign an EIP to the mgmt interface outside of the module
output "mgmt_interface_network_interface_id" {
  value       = aws_network_interface.asa_mgmt.id
  description = "The ID of the network interface of the management subnet. Set an EIP to this interface ID outside this module if you have put the management interface in a public subnet."
}
