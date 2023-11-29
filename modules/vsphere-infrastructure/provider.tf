terraform {
  required_providers {
    vsphere = {
      version = "2.6.0"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = var.allow_unverified_ssl
}