resource "random_password" "password" {
  length = 72

  min_lower   = 5
  min_upper   = 5
  min_numeric = 5
  min_special = 5

  override_special = "!@#$%&*^()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "password" {
  name         = "${var.management_group}${var.environment}vm${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}Admin"
  value        = random_password.password.result
  content_type = "VM's Admin Password"
  key_vault_id = data.azurerm_key_vault.this.id

  depends_on = [
    azurerm_windows_virtual_machine.this
  ]
}
