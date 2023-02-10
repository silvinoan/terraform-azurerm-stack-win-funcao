resource "azurerm_resource_group" "this" {
  name     = "${var.management_group}${var.environment}rg${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  location = "brazilsouth"

  tags = var.tags
}
