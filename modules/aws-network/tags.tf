module "common_tags" {
  source = "../tags"
}

locals {
  tags = merge(module.common_tags.required_tags, {})
}