resource "azurerm_virtual_machine_extension" "domain_join" {

  name                       = "${var.management_group}${var.environment}ext${var.region}${var.critical_to_business_continuity}${var.purpose}${var.vm_identifier}"
  virtual_machine_id         = module.virtual_machine.vm_id
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = <<-SETTINGS
    {
      "Name": "bancoarbi.corp",
      "OUPath": "OU=Computadores Azure,DC=bancoarbi,DC=corp",
      "User": "svc.azureavd@bancoarbi.corp",
      "Restart": "true",
      "Options": "3"
    }
    SETTINGS

  protected_settings = jsonencode({

    "Password" : "${data.azurerm_key_vault_secret.domain_user_name.value}"

  })

  lifecycle {
    ignore_changes = [settings, protected_settings]
  }
}

#resource "azurerm_virtual_machine_extension" "setdns" {
#  depends_on = [
#    module.virtual_machine
#  ]
#  name                 = "set_arbi_dns"
#  virtual_machine_id   = module.virtual_machine.vm_id
#  publisher            = "Microsoft.Compute"
#  type                 = "CustomScriptExtension"
#  type_handler_version = "1.9"
#  settings = <<SETTINGS
#    {
#      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -Command Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses \"192.168.5.62\", \"192.168.128.20\""
#    }
#SETTINGS
#}
