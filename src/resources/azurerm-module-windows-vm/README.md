<!-- BEGIN_TF_DOCS -->
# Terraform Azure Module: Windows VM

Module responsible for deploying a simple Windows VM.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.41.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.93.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.aset](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/availability_set) | resource |
| [azurerm_data_protection_backup_instance_disk.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/data_protection_backup_instance_disk) | resource |
| [azurerm_data_protection_backup_policy_disk.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/data_protection_backup_policy_disk) | resource |
| [azurerm_data_protection_backup_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/data_protection_backup_vault) | resource |
| [azurerm_key_vault_secret.password](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/key_vault_secret) | resource |
| [azurerm_managed_disk.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/network_interface) | resource |
| [azurerm_proximity_placement_group.appgrp](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/proximity_placement_group) | resource |
| [azurerm_role_assignment.this1](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.this2](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/role_assignment) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_windows_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/resources/windows_virtual_machine) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/password) | resource |
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.41.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_critical_to_business_continuity"></a> [critical\_to\_business\_continuity](#input\_critical\_to\_business\_continuity) | (Required) Is the VM critical to business continuity? | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The VM's Environment. | `string` | n/a | yes |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | (Required) The name of the Key Vault in which the VM's Admin Password is stored. | `string` | n/a | yes |
| <a name="input_key_vault_resource_group"></a> [key\_vault\_resource\_group](#input\_key\_vault\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_management_group"></a> [management\_group](#input\_management\_group) | (Required) The VM's Management Group. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | (Required) The VM's reason to exist/purpose. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Required) The VM's Azure Region. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | (Required) The name of the resource group in which the VM is created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) A mapping of tags which should be assigned to this Virtual Machine. | `map(string)` | n/a | yes |
| <a name="input_vm_identifier"></a> [vm\_identifier](#input\_vm\_identifier) | (Required) The VM identifier, to make it unique among multiple VMs. | `string` | n/a | yes |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | Managed Data Disks for azure viratual machine | <pre>list(object({<br>    name                 = string<br>    storage_account_type = string<br>    disk_size_gb         = number<br>  }))</pre> | `[]` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | (Optional) Should Accelerated Networking be enabled? | `bool` | `true` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | (Optional) Should IP forwarding be enabled? | `bool` | `true` | no |
| <a name="input_enable_proximity_placement_group"></a> [enable\_proximity\_placement\_group](#input\_enable\_proximity\_placement\_group) | Manages a proximity placement group for virtual machines, virtual machine scale sets and availability sets. | `bool` | `false` | no |
| <a name="input_enable_vm_availability_set"></a> [enable\_vm\_availability\_set](#input\_enable\_vm\_availability\_set) | Manages an Availability Set for Virtual Machines. | `bool` | `false` | no |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | (Optional) List of NICs for the VM, every map inside this list corresponds to an IP Configuration for each NIC. | `list(map(string))` | `[]` | no |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | Specifies the number of fault domains that are used | `number` | `3` | no |
| <a name="input_platform_update_domain_count"></a> [platform\_update\_domain\_count](#input\_platform\_update\_domain\_count) | Specifies the number of update domains that are used | `number` | `5` | no |
| <a name="input_size"></a> [size](#input\_size) | (Optional) The SKU which should be used for this Virtual Machine, such as Standard\_F2. | `string` | `"Standard_F2"` | no |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | (Optional) The Reference of the Image which this Virtual Machine should be created from. | `map(string)` | <pre>{<br>  "offer": "WindowsServer",<br>  "publisher": "MicrosoftWindowsServer",<br>  "sku": "2019-Datacenter",<br>  "version": "latest"<br>}</pre> | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | (Optional) Specifies the Time Zone which should be used by the Virtual Machine. | `string` | `"Central Brazilian Standard Time"` | no |
| <a name="input_vm_availability_zone"></a> [vm\_availability\_zone](#input\_vm\_availability\_zone) | The Zone in which this Virtual Machine should be created. Conflicts with availability set and shouldn't use both | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_password_id"></a> [password\_id](#output\_password\_id) | Version of the Key Vault Secret where the VM's Admin Password is stored. |
| <a name="output_password_version"></a> [password\_version](#output\_password\_version) | Version of the Key Vault Secret where the VM's Admin Password is stored. |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | The ID of the Virtual Machine. |
<!-- END_TF_DOCS -->