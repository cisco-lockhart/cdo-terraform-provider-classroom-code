locals {
  asa_in_datacenter    = "asa-in-datacenter"
  asa_in_datacenter_ip = "10.10.0.168"
}

resource "cdo_asa_device" "asa-on-vsphere" {
  name               = local.asa_in_datacenter
  connector_type     = "SDC"
  connector_name     = cdo_sdc.sdc-in-vsphere.name
  username           = local.asa_in_dc_username
  password           = local.asa_in_dc_password
  socket_address     = "${local.asa_in_datacenter_ip}:443"
  ignore_certificate = false
}
