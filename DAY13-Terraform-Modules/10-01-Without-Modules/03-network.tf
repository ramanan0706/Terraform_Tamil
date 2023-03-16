
data "azurerm_subnet" "terra-subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_network_interface" "name" {
  name = "terra-nw-interface"
    location             = var.location
  resource_group_name  = var.resource_group_name
  ip_configuration {
    name = "interal"
    subnet_id = data.azurerm_subnet.terra-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "terra-nsg" {
  name = "terra-nsg"
  location             = var.location
  resource_group_name  = var.resource_group_name
  security_rule  = var.security_rule

}

resource "azurerm_network_interface_security_group_association" "name" {
  network_interface_id = azurerm_network_interface.name.id
  network_security_group_id = azurerm_network_security_group.terra-nsg.id
}

