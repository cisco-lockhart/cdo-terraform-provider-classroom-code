variable "vpc_id" {
  description = "The AWS VPC to deploy the ASAv in."
  type        = string
}

variable "base_name" {
  description = "The base name is a prefix assigned to all of the resources created for the ASAv. It typically corresponds to the name of the CDO environment that the ASAv will be onboarded to."
  type        = string
}

variable "mgmt_subnet" {
  description = "Specify the management subnet."
  type        = string
}

variable "inside_subnet" {
  description = "Specify the inside subnet."
  type        = string
}

variable "outside_subnet" {
  description = "Specify the outside subnet."
  type        = string
}

variable "dmz_subnet" {
  description = "Specify the DMZ subnet. Defaults to null."
  type        = string
  default     = null
}

variable "mgmt_private_ip" {
  description = "Private IP to assign to the management interface"
  type        = string
  default     = ""
}

variable "inside_private_ip" {
  description = "Private IP to assign to the inside interface"
  type        = string
  default     = ""
}

variable "outside_private_ip" {
  description = "Private IP to assign to the outside interface"
  type        = string
  default     = ""
}

variable "dmz_private_ip" {
  description = "Private IP to assign to the DMZ interface"
  type        = string
  default     = ""
}

variable "asav_instance_size" {
  default     = "c5a.large"
  type        = string
  description = "Size of the EC2 instance used to run the SDC). Allowed values: See the [Cisco Secure Firewall ASA Virtual](https://aws.amazon.com/marketplace/pp/prodview-sltshxd3bzqbg) page on the AWS Marketplace."
}

variable "asa_hostname" {
  description = "The hostname of the ASA."
  type        = string
  default     = "asa-01"
}

variable "ssh_key_name" {
  description = "The key to use on the ASAv for SSH."
  default     = "lh-localdev-server"
  type        = string
}

variable "bastion_sg" {
  description = "The ASAv is configured, for security reasons, so that SSH access to its management interface is restricted to instances using a specified security group. Specify the security group here."
  type        = string
}

variable "asa_password" {
  description = "The password for the admin user (with privilege level 15) that will be used to connect to the ASAv."
  type        = string
}

variable "asa_username" {
  description = "The name of the admin user (with privilege level 15) that will be used to connect to the ASAv."
  type        = string
}

variable "asa_version" {
  description = "The version of the ASAv to deploy."
  default     = "9-19"
  type        = string
}

variable "enable_password" {
  description = "The enable password lets you enter privileged EXEC mode. Specify the enable password here."
  type        = string
}

variable "aws_region" {
  description = "The AWS region the ASAv is being deployed in. This is required in order to wait for the ASAv to become available."
  type        = string
}

variable "bastion_public_ip" {
  description = "We expect the ASA to be deployed in a private subnet accessible only through a Bastion host. Provide the public IP of the bastion host so that the module can SSH into it and wait until the ASA is ready."
  type        = string
}

variable "bastion_private_key" {
  description = "We expect the ASA to be deployed in a private subnet accessible only through a Bastion host. Provide the private SSH key of the bastion host so that the module can SSH into it and wait until the ASA is ready."
  type        = string
}

variable "bastion_username" {
  description = "The username for the bastion host."
  type        = string
  default     = "centos"
}

variable "tenant_name" {
  description = "Specify the name of the tenant."
  type        = string
}

variable "assign_eip_to_outside" {
  type    = bool
  default = true
}

variable "asa_startup_config" {
  type        = string
  description = "Specify the ASA startup config, if you do not want to use the default ASA startup config"
  default     = null
}
