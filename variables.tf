variable "vm_folder" {
  type = string
}

variable "cdo_base_url" {
  description = "The base CDO URL. This is the URL you enter when logging into your CDO account."
  type        = string
  # this is being used in Cisco Live Melbourne, so we're using CDO in APJ
  default = "https://apj.cdo.cisco.com"
}

variable "cdo_api_token" {
  description = "The API token used to authenticate with CDO. Watch this video to learn how to generate this value: https://app.vidcast.io/share/e3fb2957-0991-4a98-a256-46485323a703. Please enter this value in secrets.auto.tfvars."
  type        = string
  sensitive   = true
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

variable "classroom_namespace" {
  type    = string
  default = "cl-melbourne"
}

variable "msp_employees" {
  description = "Specify a list of CDO users you want to add to this tenant with superadmin privileges. We have provided default values in terraform.auto.tfvars in case you do not wish to enter your own. These users have to have valid Cisco Security accounts."
  type        = set(string)
}