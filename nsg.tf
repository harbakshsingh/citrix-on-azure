resource "azurerm_network_security_group" "Netscaler-nsg" {
  name                = "Netscaler-12.1-VPX-nsg"
  location            = azurerm_resource_group.citrixrg-paris.location
  resource_group_name = azurerm_resource_group.citrixrg-paris.name
}



resource "azurerm_network_security_group" "MI-nsg" {
  name                = "Win2k19-MI-nsg"
  location            = azurerm_resource_group.citrixrg-germany.location
  resource_group_name = azurerm_resource_group.citrixrg-germany.name

}

resource "azurerm_network_security_group" "DC-nsg" {
  name                = "WIn2k19-DC01-nsg"
  location            = azurerm_resource_group.citrixrg-neth.location
  resource_group_name = azurerm_resource_group.citrixrg-neth.name

}


resource "azurerm_network_security_group" "SF-nsg" {
  name                = "WIn2k19-SF01-nsg"
  location            = azurerm_resource_group.citrixrg-ireland.location
  resource_group_name = azurerm_resource_group.citrixrg-ireland.name

}

# resource "azurerm_network_security_group" "DC-backup-nsg" {
#  name                = "Win2k19-SF-DC02-nsg"
#  location            = azurerm_resource_group.citrixrg.location
#  resource_group_name = azurerm_resource_group.citrixrg.name
#}


resource "azurerm_network_security_group" "DomainController-nsg" {
  name                = "Windows2016-AD-nsg"
  location            = azurerm_resource_group.citrixrg.location
  resource_group_name = azurerm_resource_group.citrixrg.name

}

