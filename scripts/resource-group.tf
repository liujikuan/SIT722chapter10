provider "azurerm" {
#  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
resource "azurerm_resource_group" "flixtube" {
  name     = var.app_name
  location = var.location
}
