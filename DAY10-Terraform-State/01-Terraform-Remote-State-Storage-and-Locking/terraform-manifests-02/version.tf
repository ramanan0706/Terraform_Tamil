# Terraform Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "terraform-rg-01"
    storage_account_name = "terraformstatestorage"
    container_name = "terraform-state"
    key = "dev.terraform.state"
  }
}


# Provider Block

provider "azurerm" {
  features { }
}