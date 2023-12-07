resource "cdo_cdfmc" "tenant_cdfmc" {}

data "cdo_cdfmc" "current" {}

provider "fmc" {
  fmc_host          = data.cdo_cdfmc.current.hostname
  is_cdfmc          = true
  cdo_token         = var.cdo_api_token
  cdfmc_domain_uuid = data.cdo_cdfmc.current.domain_uuid
}

resource "fmc_url_object_group" "fun_websites" {
  name        = "fun-websites"
  description = "Websites that are too much fun for the 9-5"
  literals {
    url = "https://www.facebook.com"
  }
  literals {
    url = "https://www.tiktok.com"
  }
  literals {
    url = "https://www.bored.com"
  }
}

resource "fmc_access_policies" "fmc_access_policy" {
  name           = "terraformed-access-policy"
  default_action = "PERMIT"
}

resource "fmc_access_rules" "block_fun_websites" {
  acp     = fmc_access_policies.fmc_access_policy.id
  section = "mandatory"
  name    = "Block fun websites"
  action  = "block"
  enabled = true
  urls {
    url {
      id   = fmc_url_object_group.fun_websites.id
      type = "UrlGroup"
    }
  }
}

