variable "vpc_id" {
  description = "The AWS VPC to deploy the FTDv in."
  type        = string
}
variable "base_name" {
  description = "The base name is a prefix assigned to all of the resources created for the FTDv. It typically corresponds to the name of the CDO environment that the FTDv will be onboarded to."
  type        = string
}

variable "aws_region" {
  description = "The AWS region the ASAv is being deployed in. This is required in order to wait for the ASAv to become available."
  type        = string
}

variable "mgmt_private_ip" {
  description = "Private IP to assign to the management interface"
  type        = string
  default     = ""
}

variable "ftd_version" {
  description = "The version of the FTDv to deploy."
  type        = string
  default     = "7.3"
}
variable "ftdv_instance_size" {
  description = "Size of the EC2 instance used to run the SDC). Allowed values: See the [Cisco Secure Firewall Firewall Threat Defense Virtual](https://aws.amazon.com/marketplace/pp/prodview-agotwrhawevmc) page on the AWS Marketplace."
  type        = string
  default     = "c5.xlarge"
}
variable "bastion_sg" {
  description = "The FTDv is configured, for security reasons, so that SSH access to its management interface is restricted to instances using a specified security group. Specify the security group here."
  type        = string
}
variable "ftd_hostname" {
  description = "The hostname of the FTDv."
  type        = string
  default     = "FTD-01"
}

variable "ftd_admin_password" {
  description = "Admin Password for the FTD."
  type        = string
}

variable "fmc_reg_key" {
  description = "The registration key shared by the FMC."
  type        = string
}
variable "fmc_nat_id" {
  description = "The NAT ID shared by the FMC. The NAT ID is a one-time password used only during registration."
  type        = string
}

variable "fmc_hostname" {
  description = "The FMC hostname to connect to."
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

variable "mgmt_subnet" {
  type = string
}

variable "outside_subnet" {
  type = string
}
variable "inside_subnet" {
  type = string
}

# optional DMZ subnet
variable "dmz_subnet" {
  type    = string
  default = null
}

variable "should_create_dmz_subnet" {
  default = false
}

variable "outside_eip_count" {
  type    = number
  default = 0
}
