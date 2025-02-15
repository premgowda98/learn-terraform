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

[Terraform Referrence](https://github.com/piyushsachdeva/Terraform-Full-Course-Azure/)

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

### State File

1. This file tracks the state of the desired and actual infrastructure state
2. This is usually not version controlled and usually stored in remote backends.
3. Remote Backends -> Azure Blob, AWS S3


### Variables

1. Types
    1. Input
    2. Output
    3. Local
2. Precedence
3. To specy var during runtime `terraform apply -env=environment=dev`
4. To provide vars using environment variables, the variables has to be prefixed with *TF_VAR*
5. If variables are to be defined in separae file, then it must be named *terraform.tfvars*
6. Data Types
    1. String
    2. List
    3. Bool
    4. Number
    5. Set
    6. Map
    7. Object
7. Map vs Object
    1. Map can have only one type of data in the values `map(string)`
    2. If each value to be of different data type, then we can use object.
8. Meta Arguments
    1. depends_on
    2. count
    3. for_each
    4. provider
    5. lifecycle


### Lifecycle

Defined inside resource block
1. Create before destroy
2. Prevent destroy
3. Ignore Changes
4. Custom Condition
    1. precondition
    2. postcondition

### Expresions

1. Dynamic
2. Conditional

## [Functions](https://developer.hashicorp.com/terraform/language/functions)

1. `terraform console`
2. Terraform does not support custom functions

## Data Sources