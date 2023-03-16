resource "azurerm_linux_virtual_machine" "terra-linux-vm-01" {
  resource_group_name = var.resource_group_name
  name = "terra-vm-02"
  location = var.location
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  size = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.name.id]
  disable_password_authentication = false
  admin_username = "azureuser"
  admin_password = "akduz#lskfj*lsdj@lksjdfKDHFK"
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}




