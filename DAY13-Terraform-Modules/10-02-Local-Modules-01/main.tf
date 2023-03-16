module "azure-vm-01" {
  source = "./module-azure"
  network_interface_name = "terraform-rg-01"
  virtual_network_name = "dev-vm-network-01"
  vm_name = "vm-01"
  disk_name = "vmdisk01"
  disk_size = "10"
  network_sg_name = "default"
}

module "azure-vm-02" {
  source = "./module-azure"
  resource_group_name = "terraform-rg-02"
  network_interface_name = "terraform-rg-02"
  virtual_network_name = "dev-vm-network-02"
  vm_name = "vm-02"
  disk_name = "vmdisk02"
  disk_size = "10"
  network_sg_name = "default"
}