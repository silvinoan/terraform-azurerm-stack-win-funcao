resource "azurerm_managed_disk" "data_disk" {

  depends_on = [
    azurerm_windows_virtual_machine.this
  ]

  for_each             = local.vm_data_disks
  name                 = "${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}_DataDisk"
  resource_group_name  = data.azurerm_resource_group.this.name
  location             = data.azurerm_resource_group.this.location
  storage_account_type = lookup(each.value.data_disk, "storage_account_type", "StandardSSD_LRS")
  create_option        = "Empty"
  disk_size_gb         = each.value.data_disk.disk_size_gb

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk" {

  depends_on = [
    azurerm_managed_disk.data_disk
  ]

  for_each           = local.vm_data_disks
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.this.id
  lun                = each.value.idx
  caching            = "ReadWrite"
}
