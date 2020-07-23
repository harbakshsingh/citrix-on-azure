# Configure the Azure Provider
provider "azurerm" {
  version                    = "1.38.0"
  skip_provider_registration = true

}

# create resource group
resource "azurerm_resource_group" "citrixrg" {
  name     = "citrixrg"
  location = "uksouth"
}

resource "azurerm_resource_group" "citrixrg-ireland" {
  name     = "citrixrg-ireland"
  location = "northeurope"
}

resource "azurerm_resource_group" "citrixrg-paris" {
  name     = "citrixrg-paris"
  location = "francecentral"
}


resource "azurerm_resource_group" "citrixrg-germany" {
  name     = "citrixrg-germany"
  location = "germanywestcentral"
}



resource "azurerm_resource_group" "citrixrg-neth" {
  name     = "citrixrg-neth"
  location = "westeurope"
}



resource "azurerm_virtual_network" "harbakshsingh-vnet" {
  name                = "harbakshsingh-vnet"
  location            = azurerm_resource_group.citrixrg.location
  resource_group_name = "citrixrg"
  address_space = [
    "10.0.0.0/24",
    "192.168.1.0/24",
    "10.1.0.0/24"
  ]
}

resource "azurerm_virtual_network" "harbakshsingh-vnet-ireland" {
  name                = "harbakshsingh-vnet-ireland"
  location            = azurerm_resource_group.citrixrg-ireland.location
  resource_group_name = "citrixrg-ireland"
  address_space = [
    "10.10.0.0/24",
    "192.168.2.0/24",
    "10.11.0.0/24"
  ]
}

resource "azurerm_virtual_network" "harbakshsingh-vnet-paris" {
  name                = "harbakshsingh-vnet-paris"
  location            = azurerm_resource_group.citrixrg-paris.location
  resource_group_name = "citrixrg-paris"
  address_space = [
    "10.20.0.0/24",
    "192.168.3.0/24",
    "10.21.0.0/24"
  ]
}


resource "azurerm_virtual_network" "harbakshsingh-vnet-germany" {
  name                = "harbakshsingh-vnet-germany"
  location            = azurerm_resource_group.citrixrg-germany.location
  resource_group_name = "citrixrg-germany"
  address_space = [
    "10.30.0.0/24",
    "192.168.4.0/24",
    "10.31.0.0/24"
  ]
}


resource "azurerm_virtual_network" "harbakshsingh-vnet-neth" {
  name                = "harbakshsingh-vnet-neth"
  location            = azurerm_resource_group.citrixrg-neth.location
  resource_group_name = "citrixrg-neth"
  address_space = [
    "10.40.0.0/24",
    "192.168.5.0/24",
    "10.41.0.0/24"
  ]
}

