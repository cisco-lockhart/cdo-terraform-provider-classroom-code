terraform {
  required_providers {
    cdo = {
      source  = "CiscoDevnet/cdo"
      version = ">=0.14.5"
    }
    fmc = {
      source  = "CiscoDevNet/fmc"
      version = "1.4.6"
    }
    aws = {
      version = ">=5.28.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

provider "cdo" {
  api_token = var.cdo_api_token
  base_url  = var.cdo_base_url
}

provider "vsphere" {
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = var.allow_unverified_ssl
}