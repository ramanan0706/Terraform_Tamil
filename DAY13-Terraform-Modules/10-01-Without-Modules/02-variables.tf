variable "resource_group_name" {
  type = string
  default = "terraform-rg-01"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "virtual_network_name" {
    type = string
    default = "dev-vm-network-01"
}

variable "subnet_name" {
    type = string
    default = "default"
}

variable "security_rule" {
  type = list(any)
  default = [{
    name = "inbound-1"
    description = "test"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    access = "Allow"
    priority = 100
    direction = "Inbound"
    destination_application_security_group_ids = []
    source_application_security_group_ids = []
    destination_address_prefixes = []
    destination_port_ranges = []
    source_address_prefixes = []
    source_port_ranges = []
  }]
}