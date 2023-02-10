resource "azurerm_availability_set" "aset" {
  count                        = var.enable_vm_availability_set ? 1 : 0
  name                         = lower("avail-${data.azurerm_resource_group.this.name}-${data.azurerm_resource_group.this.location}")
  resource_group_name          = data.azurerm_resource_group.this.name
  location                     = data.azurerm_resource_group.this.location
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  proximity_placement_group_id = var.enable_proximity_placement_group ? azurerm_proximity_placement_group.appgrp.0.id : null
  managed                      = true
  tags                         = merge({ "ResourceName" = lower("avail-${data.azurerm_resource_group.this.location}") }, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_proximity_placement_group" "appgrp" {
  count               = var.enable_proximity_placement_group ? 1 : 0
  name                = lower("proxigrp-${data.azurerm_resource_group.this.name}-${data.azurerm_resource_group.this.location}")
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  tags                = merge({ "ResourceName" = lower("proxigrp-${data.azurerm_resource_group.this.location}") }, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
