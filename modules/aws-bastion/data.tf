data "aws_ami" "default_cisco_hardened_ami" {
  owners      = ["849570812361"]
  most_recent = true
  filter {
    name   = "name"
    values = ["CiscoHardened-Ubuntu22.04LTS-amd64*"]
  }
}
