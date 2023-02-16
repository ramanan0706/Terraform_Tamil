terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion     = false
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
  alias = "delete_vm_disk"

}