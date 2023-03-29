terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }

}


# Provider Block

provider "azurerm" {
  features { }
}

terraform {
  cloud {
    organization = "skillupwithstan"

    workspaces {
      name = "module-testing"
    }
  }
}


module "virtual-machine" {
  source  = "app.terraform.io/skillupwithstan/virtual-machine/azurerm"
  version = "1.0.1"
  resource_group_name = "terraform-cloud-res-01"
  virtual_network_name = "test-vnet"
  subnet_name = "default"
}