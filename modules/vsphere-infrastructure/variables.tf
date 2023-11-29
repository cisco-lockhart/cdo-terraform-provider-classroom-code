variable "classroom_namespace" {
  type    = string
  default = "cl-melbourne"
}

variable "vm_folder" {
  type = string
}

variable "vsphere_server" {
  description = "Specify the vCenter Server FQDN or IP Address for vSphere API operations."
  type        = string
}

variable "vsphere_username" {
  description = "Specify the username for vSphere API operations."
  type        = string
  default     = ""
}

variable "vsphere_password" {
  description = "Specify the password for vSphere API operations."
  type        = string
  sensitive   = true
  default     = ""
}

variable "datacenter" {
  description = "Specify the address of the [vSphere datacenter](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.vcenterhost.doc/GUID-7FDFBDBE-F8AC-4D00-AE5E-3F14D7472FAF.html) where the SDC should be deployed."
  type        = string
  default     = ""
}

variable "resource_pool" {
  description = "Specify the name of the [vSphere resource pool](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-resource-management/GUID-60077B40-66FF-4625-934A-641703ED7601.html) where the SDC should be deployed."
  type        = string
  default     = ""
}

variable "host" {
  description = "Specify the address of the [vSphere host](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.resmgmt.doc/GUID-487C09CE-8BE2-4B89-BA30-0E4F7E3C66F7.html) to use for the SDC."
  type        = string
  default     = ""
}

variable "datastore" {
  description = "Specify the name of the [vSphere datastore](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.storage.doc/GUID-5EE84941-366D-4D37-8B7B-767D08928888.html) to use for the SDC."
  type        = string
  default     = ""
}

variable "network" {
  description = "Specify the name of the [vSphere network](hhttps://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.networking.doc/GUID-35B40B0B-0C13-43B2-BC85-18C9C91BE2D4.html) to use for the SDC."
  type        = string
  default     = ""
}

variable "allow_unverified_ssl" {
  description = "Allow connections to vSphere over untrusted SSL connections."
  type        = bool
  default     = true
}

variable "asa_vsphere_template_name" {
  type = string
}

variable "ftd_vsphere_template_name" {
  type = string
}