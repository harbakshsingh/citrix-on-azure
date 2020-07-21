



resource "azurerm_virtual_machine" "ns" {
  name                  = "Netscaler-12.1-VPX"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.ns-nic.id]
  vm_size               = "Standard_D4s_v3"

  boot_diagnostics {
    enabled     = true
    storage_uri = "https://harbakshsinghdiag.blob.core.windows.net/"
  }
  os_profile {
    admin_username = "Nsroot"
    computer_name  = "Netscaler-12.1-VPX"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  plan {
    name      = "netscalervpxexpress"
    product   = "netscalervpx-121"
    publisher = "citrix"
  }
  storage_image_reference {
    offer     = "netscalervpx-121"
    publisher = "citrix"
    sku       = "netscalervpxexpress"
    version   = "121.57.18"
  }
  storage_os_disk {
    name              = "nsdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}

//resource "azurerm_managed_disk" "dc01backup" {
//  name = "dc01-backup"
//  resource_group_name = azurerm_resource_group.harbakshsingh.name
//  create_option = ""
//  location = azurerm_resource_group.harbakshsingh.location
//  storage_account_type = "StandardSSD_LRS"
//}

resource "azurerm_virtual_machine" "dc" {
  name                = "WIn2k19-DC01"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [
  azurerm_network_interface.dc-nic.id]
  vm_size = "Standard_D4s_v3"
  boot_diagnostics {
    enabled     = true
    storage_uri = "https://harbakshsinghdiag.blob.core.windows.net/"
  }
  storage_os_disk {
    name              = "dcdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    admin_username = "winadmin"
    computer_name  = "WIn2k19-DC01"
  }
  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }
  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
resource "azurerm_virtual_machine" "mi" {
  name                  = "Win2k19-MI"
  location              = azurerm_resource_group.harbakshsingh.location
  resource_group_name   = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [azurerm_network_interface.mi-nic.id]
  vm_size               = "Standard_DS1_v2"

  boot_diagnostics {
    enabled     = true
    storage_uri = "https://harbakshsinghdiag.blob.core.windows.net/"
  }
  os_profile { # forces replacement
    admin_username = "winadmin"
    computer_name  = "Win2k19-MI"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "mi-disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}



resource "azurerm_virtual_machine" "dc-backup" {
  name                = "Win2k19-SF-DC02"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
  network_interface_ids = [
  azurerm_network_interface.dc-backup-nic.id]
  vm_size = "Standard_D4s_v3"


  tags = {
    "role1" = "storefront02"
    "role2" = "deliverycontroller02"
    "role3" = "director"
    "role4" = "license-server"
  }
  boot_diagnostics {
    enabled     = true
    storage_uri = "https://harbakshsinghdiag.blob.core.windows.net/"
  }
  os_profile {
    admin_username = "winadmin"
    computer_name  = "Win2k19-SF-DC02"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true

  }
  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "dc-backup"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
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
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = "https://harbakshsinghdiag.blob.core.windows.net/"
  }
  os_profile {
    admin_username = "winadmin"
    computer_name  = "WIn2k19-SF01"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }
  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
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
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  boot_diagnostics {
    enabled     = true
    storage_uri = "https://harbakshsinghdiag.blob.core.windows.net/"
  }

  os_profile {
    admin_username = "winadmin"
    computer_name  = "Windows2016-AD"
  }
  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }
  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

}
