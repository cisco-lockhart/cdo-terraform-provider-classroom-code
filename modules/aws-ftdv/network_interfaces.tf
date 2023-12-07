resource "aws_network_interface" "ftd_mgmt" {
  # 1x management interface, 1x diag interface
  count             = 2
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-${count.index}-mgmt"
  subnet_id         = var.mgmt_subnet
  private_ips       = var.mgmt_private_ip != "" && count.index == 0 ? [var.mgmt_private_ip] : null
  source_dest_check = false
  security_groups   = [aws_security_group.mgmt_interface_security_group.id]
}
resource "aws_network_interface" "ftd_outside" {
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-outside"
  subnet_id         = var.outside_subnet
  source_dest_check = false
  security_groups   = [aws_security_group.outside_interface_security_group.id]
}

resource "aws_eip" "ftdv_outside_eip" {
  count             = var.outside_eip_count
  network_interface = aws_network_interface.ftd_outside.id
}

resource "aws_network_interface" "ftd_inside" {
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-inside"
  subnet_id         = var.inside_subnet
  source_dest_check = false
  security_groups   = [aws_security_group.inside_interface_security_group.id]
}

# Optional DMZ interface
resource "aws_network_interface" "ftd_dmz" {
  count             = var.dmz_subnet != null ? 1 : 0
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-dmz"
  subnet_id         = var.dmz_subnet
  source_dest_check = false
  security_groups   = [aws_security_group.dmz_interface_security_group[0].id]
}
