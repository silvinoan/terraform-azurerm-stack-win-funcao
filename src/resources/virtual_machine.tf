module "virtual_machine" {

  depends_on = [azurerm_resource_group.this, azurerm_key_vault.this]

  source = "./azurerm-module-windows-vm"

  vm_identifier = var.vm_identifier

  resource_group = azurerm_resource_group.this.name

  key_vault                = azurerm_key_vault.this.name
  key_vault_resource_group = azurerm_resource_group.this.name

  source_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  network_interfaces = [
    {
      ip_configuration_name         = var.ip_configuration_name
      subnet_id                     = data.azurerm_subnet.this.id
      private_ip_address_allocation = "Static"
      private_ip_address            = var.private_ip_address
    }
  ]

  size = "Standard_D2ads_v5"

  enable_proximity_placement_group = false
  enable_vm_availability_set       = false

  management_group = var.management_group

  purpose = var.purpose

  environment = var.environment

  region = var.region

  critical_to_business_continuity = var.critical_to_business_continuity

  tags = var.tags
}
