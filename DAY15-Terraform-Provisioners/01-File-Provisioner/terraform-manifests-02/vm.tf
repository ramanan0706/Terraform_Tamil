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
  admin_username = "azureuser"
  disable_password_authentication = true
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
  username   = "azureuser"
  public_key = file("~/.ssh/suresh.akidev.pub")
  }

  connection {
    host = self.public_ip_address
    type = "ssh"
    user = "azureuser"
    private_key = file("~/.ssh/suresh.akidev")
  }

  provisioner "file" {
    source = "apps/app1"
    destination = "/tmp/"
  }
}
