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
    environment = var.environment
  }

  depends_on = [ azurerm_resource_group.basic ]
}
