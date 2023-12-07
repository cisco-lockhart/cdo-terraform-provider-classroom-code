resource "aws_network_interface" "asa_mgmt" {
  description       = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-mgmt"
  subnet_id         = var.mgmt_subnet
  private_ips       = var.mgmt_private_ip == "" ? null : [var.mgmt_private_ip]
  source_dest_check = false
  security_groups   = [aws_security_group.mgmt_interface_security_group.id]
}

resource "aws_network_interface" "asa_outside" {
  description       = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-outside"
  subnet_id         = var.outside_subnet
  private_ips       = var.outside_private_ip == "" ? null : [var.outside_private_ip]
  source_dest_check = false
  security_groups   = [aws_security_group.outside_interface_security_group.id]
}

resource "aws_eip" "asa_outside_eip" {
  count             = var.assign_eip_to_outside == true ? 1 : 0
  network_interface = aws_network_interface.asa_outside.id
}

resource "aws_network_interface" "asa_inside" {
  description       = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-inside"
  subnet_id         = var.inside_subnet
  private_ips       = var.inside_private_ip == "" ? null : [var.inside_private_ip]
  source_dest_check = false
  security_groups   = [aws_security_group.inside_interface_security_group.id]
}

# Optional DMZ interface
resource "aws_network_interface" "asa_dmz" {
  count             = var.dmz_subnet == null ? 0 : 1
  description       = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-asav-dmz"
  subnet_id         = var.dmz_subnet
  private_ips       = var.dmz_private_ip == "" ? null : [var.dmz_private_ip]
  source_dest_check = false
  security_groups   = [aws_security_group.dmz_interface_security_group[0].id]
}
