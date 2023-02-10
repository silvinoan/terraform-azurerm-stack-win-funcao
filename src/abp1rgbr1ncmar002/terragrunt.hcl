include {
  path = find_in_parent_folders()
}

inputs = {
  resource_group = path_relative_to_include()

  subnet_resource_group = "abp1rgeaus1crplt001"

  vnet = "abp1vnetbrsh1crplt001"

  subnet = "abp1snetbrsh1crmgm001"

  ip_configuration_name = "ipconfig1"

  management_group = "ab"

  purpose = "mar"

  environment = "p1"

  region = "br1"

  critical_to_business_continuity = "nc"

  admin_password = ""

  key_vault_name = "abp1kvsobr1crfnc001"

  key_vault_name_rg = "abp1rgsobr1crfnc001"

  secret_domainadmin_name = "arbi-domain-pwd"

  vm_identifier = "002"

  private_ip_address = "10.37.1.205"

  key_vault_secret_officer_group = "TI-Infra-azure"

  key_vault_ip_rules             =  "200.222.105.235"

  tags = {
    "context"                          = "arbi"
    "critical_for_business_continuity" = "nc"
    "environment"                      = "p1"
    "management_group"                 = "ab"
    "project"                          = "projeto-funcao"
    "purpose"                          = "mar"
  }
}
