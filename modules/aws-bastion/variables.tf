variable "bastion_instance_type" {
  default = "t3.medium"
}

variable "ssh_key_name" {
  default = null
}

variable "subnet_id" {}

variable "classroom_namespace" {}

variable "vpc_id" {}

variable "enable_ssh_access" {
  default = false
}