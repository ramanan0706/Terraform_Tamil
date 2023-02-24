
resource "azurerm_virtual_network" "terra_nw_01" {
  name = "terra-vm-network-01"
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  address_space = [ "10.0.0.0/16"]
  location = azurerm_resource_group.terra_rg_01.location
}

resource "azurerm_resource_group" "terra_rg_01" {
  name = "terra-rg-01"
  location = "eastus"
  tags = {
    "name" = "sample"
    "location" = "us east"
  }
}

resource "azurerm_subnet" "terra_subnet_01" {
  name = "terra-subnet-01"
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  virtual_network_name = azurerm_virtual_network.terra_nw_01.name
  address_prefixes = [ "10.0.2.0/24" ]
}

resource "azurerm_network_interface" "terra-nw-interface" {
  ip_configuration {
    name = "nw-inter-01"
    subnet_id = azurerm_subnet.terra_subnet_01.id
    private_ip_address_allocation = "Dynamic"
  }
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  location = azurerm_resource_group.terra_rg_01.location
  name = "networkface-01"

}

resource "azurerm_network_security_group" "nsg_01" {
  name = "nsg-01"
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  location = azurerm_resource_group.terra_rg_01.location
  security_rule {
    name = "terr-rule"
    description = "terra"
    destination_address_prefix = "*"
    destination_port_range = "*"
    direction = "Inbound"
    priority = 100
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range = "*"
    access = "Allow"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id = azurerm_network_interface.terra-nw-interface.id
  network_security_group_id = azurerm_network_security_group.nsg_01.id
}