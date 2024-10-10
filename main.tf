terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rego-rg"
  location = "westus"

  tags = {
    environment = "dev"
    project     = "rego"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "rego-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "dev"
    project     = "rego"
  }
}

resource "azurerm_subnet" "subnets" {
  for_each = {
    subnet1 = "10.0.0.0/24"
    subnet2 = "10.0.2.0/24"
  }
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}