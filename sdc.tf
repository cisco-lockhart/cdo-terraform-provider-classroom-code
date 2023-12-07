locals {
  sdc_in_vsphere_ip_address = "10.10.0.172"
  vsphere_network_gateway   = "10.10.0.161"
}

resource "cdo_sdc" "sdc-in-vsphere" {
  name = "sdc-in-vsphere"
}

module "vsphere-cdo-sdc" {
  source               = "CiscoDevNet/cdo-sdc/vsphere"
  version              = "1.0.2"
  vsphere_username     = var.vsphere_username
  vsphere_password     = var.vsphere_password
  vsphere_server       = var.vsphere_server
  datacenter           = var.datacenter
  resource_pool        = var.resource_pool
  cdo_tenant_name      = data.cdo_tenant.current.human_readable_name
  datastore            = var.datastore
  network              = var.network
  host                 = var.host
  allow_unverified_ssl = var.allow_unverified_ssl
  ip_address           = local.sdc_in_vsphere_ip_address
  gateway              = local.vsphere_network_gateway
  cdo_user_password    = local.sdc_password
  root_user_password   = local.sdc_password
  cdo_bootstrap_data   = cdo_sdc.sdc-in-vsphere.bootstrap_data
}

resource "cdo_sdc_onboarding" "sdc-in-vsphere" {
  name = cdo_sdc.sdc-in-vsphere.name
}

resource "cdo_sdc" "sdc-in-aws" {
  name = "sdc-in-aws"
}

module "sdc-instance-in-aws" {
  source             = "CiscoDevNet/cdo-sdc/aws"
  version            = "1.0.0"
  cdo_bootstrap_data = cdo_sdc.sdc-in-aws.bootstrap_data
  instance_name      = "${data.cdo_tenant.current.human_readable_name}-sdc"
  vpc_id             = module.aws_network.vpc_id
  subnet_id          = module.aws_network.mgmt_subnet_id
}

resource "cdo_sdc_onboarding" "sdc-in-aws" {
  name = cdo_sdc.sdc-in-aws.name
}