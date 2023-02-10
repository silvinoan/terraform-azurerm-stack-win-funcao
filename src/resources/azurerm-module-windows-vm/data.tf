data "azurerm_resource_group" "this" {
  name = var.resource_group
}

data "azurerm_key_vault" "this" {
  name                = var.key_vault
  resource_group_name = var.key_vault_resource_group
}
