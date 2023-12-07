
locals {
  ftd_version         = "7.3"
  bastion_username    = "ubuntu"
  ftd_name_1          = "ftd-1"
  asa_in_public_cloud = "asa-in-public-cloud"
}
data "aws_region" "current" {}

data "cdo_tenant" "current" {}

module "public_cloud_asav" {
  source              = "./modules/aws-asav"
  base_name           = var.classroom_namespace
  bastion_public_ip   = module.bastion.bastion_ip
  bastion_private_key = module.bastion.bastion_private_key
  bastion_sg          = module.bastion.bastion_sg
  bastion_username    = local.bastion_username
  aws_region          = data.aws_region.current.name
  tenant_name         = data.cdo_tenant.current.name
  asa_username        = local.asa_username
  asa_password        = local.asa_password
  enable_password     = local.asa_password
  inside_subnet       = module.aws_network.inside_subnet_id
  outside_subnet      = module.aws_network.public_subnet_id
  mgmt_subnet         = module.aws_network.mgmt_subnet_id
  vpc_id              = module.aws_network.vpc_id
}

resource "cdo_asa_device" "public_cloud_asav" {
  name               = local.asa_in_public_cloud
  connector_type     = "SDC"
  connector_name     = cdo_sdc.sdc-in-aws.name
  username           = local.asa_username
  password           = local.asa_password
  socket_address     = "${module.public_cloud_asav.mgmt_interface_ip}:443"
  ignore_certificate = false
}

resource "cdo_ftd_device" "ftd" {
  name               = local.ftd_name_1
  licenses           = ["BASE"]
  virtual            = true
  performance_tier   = "FTDv5"
  access_policy_name = fmc_access_policies.fmc_access_policy.name
}

module "ftd-1" {
  source              = "./modules/aws-ftdv"
  base_name           = var.classroom_namespace
  ftd_version         = local.ftd_version
  aws_region          = data.aws_region.current.id
  vpc_id              = module.aws_network.vpc_id
  outside_subnet      = module.aws_network.public_subnet_id
  mgmt_subnet         = module.aws_network.mgmt_subnet_id
  inside_subnet       = module.aws_network.inside_subnet_id
  bastion_sg          = module.bastion.bastion_sg
  bastion_public_ip   = module.bastion.bastion_ip
  bastion_private_key = module.bastion.bastion_private_key
  bastion_username    = local.bastion_username
  ftd_hostname        = local.ftd_name_1
  ftd_admin_password  = local.ftd_password
  fmc_reg_key         = cdo_ftd_device.ftd.reg_key
  fmc_nat_id          = cdo_ftd_device.ftd.nat_id
  fmc_hostname        = cdo_cdfmc.tenant_cdfmc.hostname
}

resource "cdo_ftd_device_onboarding" "ftd" {
  ftd_uid    = cdo_ftd_device.ftd.id
  depends_on = [module.ftd-1]
}
