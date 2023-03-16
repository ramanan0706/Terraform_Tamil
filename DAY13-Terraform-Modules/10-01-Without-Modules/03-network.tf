
resource "azurerm_resource_group" "terra_rg_01" {
  name = var.resource_group_name
  location = var.location
}


resource "azurerm_virtual_network" "terra_nw_01" {
  name = var.virtual_network_name
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  address_space = var.virtual_network_address
  location = azurerm_resource_group.terra_rg_01.location
}

resource "azurerm_subnet" "terra-subnet" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  virtual_network_name = azurerm_virtual_network.terra_nw_01.name
  address_prefixes = [ "10.0.2.0/24" ]
}


resource "azurerm_network_interface" "name" {
  name = "terra-nw-interface"
    location             = var.location
  resource_group_name  = var.resource_group_name
  ip_configuration {
    name = "interal"
    subnet_id = azurerm_subnet.terra-subnet.id
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

