resource "azurerm_container_registry" "acr_repo" {
  name                     = var.name
  resource_group_name      = "unir-tfm-devops-rg"
  location                 = "East US"
  sku                      = "Standard"
  admin_enabled            = false

  tags = {
    Project = "unir-tfm"
  }
}