module "vsphere_infrastructure" {
  source                    = "./modules/vsphere-infrastructure"
  vm_folder                 = var.vm_folder
  vsphere_username          = var.vsphere_username
  vsphere_password          = var.vsphere_password
  vsphere_server            = var.vsphere_server
  datacenter                = var.datacenter
  resource_pool             = var.resource_pool
  datastore                 = var.datastore
  network                   = var.network
  host                      = var.host
  allow_unverified_ssl      = var.allow_unverified_ssl
  asa_vsphere_template_name = var.asa_vsphere_template_name
  ftd_vsphere_template_name = var.ftd_vsphere_template_name
}
