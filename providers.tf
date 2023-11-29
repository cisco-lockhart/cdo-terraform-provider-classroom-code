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
