resource "azurerm_data_protection_backup_vault" "this" {

  depends_on = [
    azurerm_managed_disk.data_disk
  ]

  name                = "${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  datastore_type      = "VaultStore"
  redundancy          = "LocallyRedundant"
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "this1" {

  depends_on = [
    azurerm_data_protection_backup_vault.this
  ]

  scope                = data.azurerm_resource_group.this.id
  role_definition_name = "Disk Snapshot Contributor"
  principal_id         = azurerm_data_protection_backup_vault.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "this2" {

  depends_on = [
    azurerm_data_protection_backup_vault.this
  ]

  for_each             = local.vm_data_disks
  scope                = azurerm_managed_disk.data_disk[each.key].id
  role_definition_name = "Disk Backup Reader"
  principal_id         = azurerm_data_protection_backup_vault.this.identity[0].principal_id
}


resource "azurerm_data_protection_backup_policy_disk" "this" {

  depends_on = [
    azurerm_data_protection_backup_vault.this
  ]

  name     = "${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  vault_id = azurerm_data_protection_backup_vault.this.id

  backup_repeating_time_intervals = ["R/2022-05-19T06:00:00+00:00/PT12H"]
  default_retention_duration      = "P7D"
}

resource "azurerm_data_protection_backup_instance_disk" "this" {

  depends_on = [
    azurerm_data_protection_backup_policy_disk.this
  ]

  for_each                     = local.vm_data_disks
  name                         = "${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  location                     = azurerm_data_protection_backup_vault.this.location
  vault_id                     = azurerm_data_protection_backup_vault.this.id
  disk_id                      = azurerm_managed_disk.data_disk[each.key].id
  snapshot_resource_group_name = data.azurerm_resource_group.this.name
  backup_policy_id             = azurerm_data_protection_backup_policy_disk.this.id
}
