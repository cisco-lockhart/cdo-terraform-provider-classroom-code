resource "vsphere_virtual_machine" "ftd_vm" {
  name                        = "${var.classroom_namespace}-ftd"
  resource_pool_id            = data.vsphere_resource_pool.resource_pool.id
  datastore_id                = data.vsphere_datastore.datastore.id
  num_cpus                    = 1
  memory                      = 8192
  guest_id                    = data.vsphere_virtual_machine.ftd_template.guest_id
  scsi_type                   = data.vsphere_virtual_machine.ftd_template.scsi_type
  folder                      = var.vm_folder
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout   = 0
  wait_for_guest_net_timeout  = 0
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.ftd_template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.ftd_template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.ftd_template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.ftd_template.id
  }
}
