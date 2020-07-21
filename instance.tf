
resource "azurerm_virtual_machine" "ns" {
  name                  = "Netscaler-12.1-VPX-nsg"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.ns-nic.id]
  vm_size               = "Standard_D4s_v3"
 storage_os_disk {
    name              = "nsdisk1"
#    caching           = "ReadWrite"
    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
  }
}


resource "azurerm_virtual_machine" "dc" {
  name                  = "WIn2k19-DC01"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.dc-nic.id]
  vm_size               = "Standard_D4s_v3"
 storage_os_disk {
    name              = "dcdisk1"
#    caching           = "ReadWrite"
    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
  }
}



resource "azurerm_virtual_machine" "mi" {
  name                  = "Win2k19-MI"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.mi-nic.id]
  vm_size               = "Standard_DS1_v2"
 storage_os_disk {
    name              = "mi-disk1"
#    caching           = "ReadWrite"
    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
  }
}



resource "azurerm_virtual_machine" "dc-backup" {
  name                  = "Win2k19-SF-DC02"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.dc-backup-nic.id]
  vm_size               = "Standard_D4s_v3"
 storage_os_disk {
    name              = "dc-backup-disk1"
#    caching           = "ReadWrite"
    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
  }
}


resource "azurerm_virtual_machine" "sf" {
  name                  = "WIn2k19-SF01"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.sf-nic.id]
  vm_size               = "Standard_D4s_v3"
 storage_os_disk {
    name              = "sf-disk1"
#    caching           = "ReadWrite"
    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
  }
}


resource "azurerm_virtual_machine" "domain-controller" {
  name                  = "Windows2016-AD"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.domain-controller-nic.id]
  vm_size               = "Standard_D2s_v3"
 storage_os_disk {
    name              = "domain-controller-disk1"
#    caching           = "ReadWrite"
    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
  }
}
