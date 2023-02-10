/**
 * # Terraform Azure Module: Windows VM
 *
 * Module responsible for deploying a simple Windows VM.
 */

terraform {
  required_version = ">= 1.1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.41.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

resource "azurerm_windows_virtual_machine" "this" {

  name          = "${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  computer_name = "${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"

  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  size                = var.size
  admin_username      = "usr${var.purpose}${var.vm_identifier}Admin"
  admin_password      = random_password.password.result

  availability_set_id   = var.enable_vm_availability_set == true ? element(concat(azurerm_availability_set.aset.*.id, [""]), 0) : null
  zone                  = var.vm_availability_zone

  network_interface_ids = azurerm_network_interface.this.*.id

  timezone = var.timezone

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
}
