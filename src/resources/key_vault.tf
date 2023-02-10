resource "azurerm_key_vault" "this" {
  name                = "${var.management_group}${var.environment}kv${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  enable_rbac_authorization = true

  enabled_for_disk_encryption     = true
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  soft_delete_retention_days      = 7
  purge_protection_enabled        = true
  sku_name                        = "standard"

  tags = var.tags

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    virtual_network_subnet_ids = [data.azurerm_subnet.this.id]
    ip_rules                   = [var.key_vault_ip_rules != null ? var.key_vault_ip_rules : null]
  }

  depends_on = [
    azurerm_resource_group.this
  ]
}
#RBAC to access key valt's secrets
resource "azurerm_role_assignment" "key_vault_secrets_adminaccess" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = data.azurerm_role_definition.key_vault_secret_officer_access.name
  principal_id         = data.azuread_group.key_vault_secret_officer_access.id
}









# resource "azurerm_key_vault" "this" {

#   depends_on = [azurerm_resource_group.this]

#   name                        = "${var.management_group}${var.environment}kv${var.region}${var.critical_to_business_continuity}${var.purpose}001"
#   location                    = azurerm_resource_group.this.location
#   resource_group_name         = azurerm_resource_group.this.name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false
#   sku_name                    = "standard"

#   network_acls {
#     bypass                     = "AzureServices"
#     default_action             = "Allow"
#     virtual_network_subnet_ids = [data.azurerm_subnet.this.id]
#   }

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azuread_client_config.current.object_id

#     key_permissions = [
#       "get", "list", "update", "create", "import", "delete", "recover", "backup", "restore", "purge",
#     ]

#     secret_permissions = [
#       "get", "list", "delete", "recover", "backup", "restore", "set", "purge",
#     ]
#   }
# }
