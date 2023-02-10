output "vm_id" {
  description = " The ID of the Virtual Machine."
  value       = azurerm_windows_virtual_machine.this.id
}

output "password_id" {
  description = "Version of the Key Vault Secret where the VM's Admin Password is stored."
  value       = azurerm_key_vault_secret.password.version
}

output "password_version" {
  description = "Version of the Key Vault Secret where the VM's Admin Password is stored."
  value       = azurerm_key_vault_secret.password.version
}
