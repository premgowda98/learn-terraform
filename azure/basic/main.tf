# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.18.0"
    }
  }
  required_version = ">= 1.10.0"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "basic" {
  name     = "terraform-learn"
  location = "South India"
}

# Create a storage account
resource "azurerm_storage_account" "basic" {
  name                     = "learnterraform"
  resource_group_name      = azurerm_resource_group.basic.name
  location                 = azurerm_resource_group.basic.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}