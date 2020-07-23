resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.citrixrg.name
  virtual_network_name = azurerm_virtual_network.harbakshsingh-vnet.name
  address_prefix       = "10.0.0.0/24"
}

resource "azurerm_subnet" "default-ireland" {
  name                 = "default-ireland"
  resource_group_name  = azurerm_resource_group.citrixrg-ireland.name
  virtual_network_name = azurerm_virtual_network.harbakshsingh-vnet-ireland.name
  address_prefix       = "10.10.0.0/24"
}

resource "azurerm_subnet" "default-paris" {
  name                 = "default-ireland"
  resource_group_name  = azurerm_resource_group.citrixrg-paris.name
  virtual_network_name = azurerm_virtual_network.harbakshsingh-vnet-paris.name
  address_prefix       = "10.20.0.0/24"
}


resource "azurerm_subnet" "default-germany" {
  name                 = "default-germany"
  resource_group_name  = azurerm_resource_group.citrixrg-germany.name
  virtual_network_name = azurerm_virtual_network.harbakshsingh-vnet-germany.name
  address_prefix       = "10.30.0.0/24"
}


resource "azurerm_subnet" "default-neth" {
  name                 = "default-neth"
  resource_group_name  = azurerm_resource_group.citrixrg-neth.name
  virtual_network_name = azurerm_virtual_network.harbakshsingh-vnet-neth.name
  address_prefix       = "10.40.0.0/24"
}

resource "azurerm_network_interface" "ns-nic" {
  name                      = "netscaler-12.1-vpx489"
  location                  = azurerm_resource_group.citrixrg-paris.location
  resource_group_name       = azurerm_resource_group.citrixrg-paris.name
  network_security_group_id = azurerm_network_security_group.Netscaler-nsg.id
  ip_configuration {
    name      = "ipconfig1"
    subnet_id = azurerm_subnet.default-paris.id
    private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/Netscaler-12.1-VPX-ip"

  }
}



resource "azurerm_network_interface" "mi-nic" {
  name                      = "win2k19-mi236"
  location                  = azurerm_resource_group.citrixrg-germany.location
  resource_group_name       = azurerm_resource_group.citrixrg-germany.name
  network_security_group_id = azurerm_network_security_group.MI-nsg.id
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default-germany.id
    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/Win2k19-MI-ip"
  }
}


resource "azurerm_network_interface" "dc-nic" {
  name                          = "win2k19-dc01-ni"
  location                      = azurerm_resource_group.citrixrg-neth.location
  resource_group_name           = azurerm_resource_group.citrixrg-neth.name
  enable_accelerated_networking = true
  network_security_group_id     = azurerm_network_security_group.DC-nsg.id
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default-neth.id
    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/WIn2k19-DC01-ip"
  }

}


#resource "azurerm_network_interface" "dc-backup-nic" {
#  name                          = "win2k19-sf-dc02810"
#  location                      = azurerm_resource_group.citrixrg.location
#  resource_group_name           = azurerm_resource_group.citrixrg.name
#  enable_accelerated_networking = true
#  network_security_group_id     = azurerm_network_security_group.DC-backup-nsg.id
#  ip_configuration {
#    name                          = "ipconfig1"
#    subnet_id                     = azurerm_subnet.default.id
#    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/Win2k19-SF-DC02-ip"
#  }
#}

resource "azurerm_network_interface" "sf-nic" {
  name                          = "win2k19-sf01768"
  location                      = azurerm_resource_group.citrixrg-ireland.location
  resource_group_name           = azurerm_resource_group.citrixrg-ireland.name
  enable_accelerated_networking = true
  network_security_group_id     = azurerm_network_security_group.SF-nsg.id

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default-ireland.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/WIn2k19-DC-SF-02-ip"
  }
}



resource "azurerm_network_interface" "domain-controller-nic" {
  name                      = "windows2016-ad578"
  location                  = azurerm_resource_group.citrixrg.location
  resource_group_name       = azurerm_resource_group.citrixrg.name
  network_security_group_id = azurerm_network_security_group.DomainController-nsg.id
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
   # public_ip_address_id          = "/subscriptions/8d680bce-ff5f-44c3-8cd3-aa877e9585f2/resourceGroups/harbakshsingh/providers/Microsoft.Network/publicIPAddresses/Windows2016-AD-ip"
  }
}
