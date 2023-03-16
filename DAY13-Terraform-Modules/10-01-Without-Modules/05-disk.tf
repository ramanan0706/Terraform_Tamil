resource "azurerm_managed_disk" "example" {
  name                 = "acctestmd"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "example-dd" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_linux_virtual_machine.terra-linux-vm-01.id
  lun                = "10"
  caching            = "ReadWrite"
}