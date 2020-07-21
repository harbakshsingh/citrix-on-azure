resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.harbakshsingh.name
  virtual_network_name = azurerm_virtual_network.harbakshsingh-vnet.name
  address_prefix       = "10.0.0.0/24"
}

resource "azurerm_network_interface" "ns-nic" {
  name                = "netscaler-12.1-vpx489"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
  network_security_group_id = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/networkSecurityGroups/Netscaler-12.1-VPX-nsg"
   ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/virtualNetworks/harbakshsingh-vnet/subnets/default"
 private_ip_address_allocation = "Dynamic"
  public_ip_address_id = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/Netscaler-12.1-VPX-ip"
  }
}



resource "azurerm_network_interface" "mi-nic" {
  name                = "win2k19-mi236"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
   ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
  private_ip_address_allocation = "Dynamic" 
 }
}


resource "azurerm_network_interface" "dc-nic" {
  name                = "win2k19-dc01-ni"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
   ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
 private_ip_address_allocation = "Dynamic" 
}
}


resource "azurerm_network_interface" "dc-backup-nic" {
  name                = "win2k19-sf-dc02810"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
   ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
 private_ip_address_allocation = "Dynamic" 
}
}

resource "azurerm_network_interface" "sf-nic" {
  name                = "win2k19-sf01768"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
   ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
 private_ip_address_allocation = "Dynamic"
}
}



resource "azurerm_network_interface" "domain-controller-nic" {
  name                = "windows2016-ad578"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name = azurerm_resource_group.harbakshsingh.name
   ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
 private_ip_address_allocation = "Dynamic"
}
}
