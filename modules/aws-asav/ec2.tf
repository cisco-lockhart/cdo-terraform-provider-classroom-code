module "common_tags" {
  source = "../tags"
}

locals {
  tags = merge(module.common_tags.required_tags, {
    TenantName = var.tenant_name
  })
}
resource "aws_instance" "asav" {
  ami           = data.aws_ami.asav.id
  instance_type = var.asav_instance_size
  key_name      = aws_key_pair.rsa_keypair.id
  tags = {
    Name = "${var.base_name}-${var.tenant_name}-${var.asa_hostname}-cisco-asav"
  }
  network_interface {
    network_interface_id = aws_network_interface.asa_mgmt.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.asa_outside.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.asa_inside.id
    device_index         = 2
  }

  # optional DMZ interface
  dynamic "network_interface" {
    for_each = var.dmz_subnet == null ? toset([]) : toset([1])

    content {
      network_interface_id = aws_network_interface.asa_dmz[0].id
      device_index         = 3
    }
  }

  user_data = var.asa_startup_config == null ? data.template_file.asav_startup_config.rendered : var.asa_startup_config
  tags_all  = local.tags
  lifecycle {
    ignore_changes = [ami, user_data]
  }
}
