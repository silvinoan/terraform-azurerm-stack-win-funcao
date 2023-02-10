data "azurerm_client_config" "current" {}

data "azuread_client_config" "current" {}

data "azurerm_subnet" "this" {
  name                 = var.subnet
  virtual_network_name = var.vnet
  resource_group_name  = var.subnet_resource_group
}

data "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_name_rg
}

data "azurerm_key_vault_secret" "domain_user_name" {
  name         = var.secret_domainadmin_name
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_role_definition" "key_vault_secret_officer_access" {
  name = "Key Vault Secrets Officer"
}

data "azuread_group" "key_vault_secret_officer_access" {
  display_name     = var.key_vault_secret_officer_group
  security_enabled = true
}
