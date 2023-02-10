resource "azurerm_network_interface" "this" {
  count = length(var.network_interfaces)

  name                = "${var.management_group}${var.environment}nic${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}${format("%03d", count.index + 1)}"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  enable_accelerated_networking = var.enable_accelerated_networking

  enable_ip_forwarding          = var.enable_ip_forwarding

  dynamic "ip_configuration" {
    for_each = var.network_interfaces
    content {
      name                          = ip_configuration.value["ip_configuration_name"]
      subnet_id                     = ip_configuration.value["subnet_id"]
      private_ip_address_allocation = ip_configuration.value["private_ip_address_allocation"]
      private_ip_address            = lookup(ip_configuration.value, "private_ip_address", null)
    }
  }
}
