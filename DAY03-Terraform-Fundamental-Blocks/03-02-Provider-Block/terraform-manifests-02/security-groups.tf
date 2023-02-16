resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = "eastus"
  resource_group_name = "terraform-rg"
}