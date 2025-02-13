# IAC (Infrastructure as Code)

### Popular Tools

1. Terraform
2. Azure ARM / Bicep
3. AWS Cloud Formation Template
4. GCP Development Manger

### Components

1. Terafform Init
2. Validate
3. Plan
4. Apply
5. Destroy

## Providers

1. Terraform Providers version is differetnt from Terraform Version
2. Types of Providers
    1. Offical
    2. Partner
    3. Community
3. More like a plugin

```terraform
terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 3.0.2"
        }
    }

    required_version = ">= 1.10.0"
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "example" { # _ is type of resource, _ is name which can be accessed in other resource
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}
```