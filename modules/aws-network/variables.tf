variable "classroom_namespace" {
  type    = string
  default = "cl-melbourne"
}

variable "root_dns_zone" {
  type    = string
  default = "ciscolive.labs.cdo.cisco.com"
}

variable "mgmt_network_cidr" {
  type    = string
  default = "10.0.2.0/25"
}

variable "inside_network_cidr" {
  type    = string
  default = "10.0.2.128/26"
}