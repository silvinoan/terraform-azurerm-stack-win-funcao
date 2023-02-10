variable "resource_group" {
  description = "(Required) The name of the resource group in which the VM is created."

  type     = string
  nullable = false
}

variable "vm_identifier" {
  description = "(Required) The VM identifier, to make it unique among multiple VMs."

  type     = string
  nullable = false
}

variable "key_vault" {
  description = "(Required) The name of the Key Vault in which the VM's Admin Password is stored."

  type     = string
  nullable = false
}

variable "size" {
  description = "(Optional) The SKU which should be used for this Virtual Machine, such as Standard_F2."

  type     = string
  default  = "Standard_F2"
  nullable = false
}

variable "network_interfaces" {
  description = "(Optional) List of NICs for the VM, every map inside this list corresponds to an IP Configuration for each NIC."

  type     = list(map(string))
  nullable = false
  default  = []
}

variable "enable_accelerated_networking" {
  description = "(Optional) Should Accelerated Networking be enabled?"

  default     = true
  type        = bool
  nullable    = false
}

variable "source_image_reference" {
  description = "(Optional) The Reference of the Image which this Virtual Machine should be created from."

  type     = map(string)
  nullable = false
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

variable "tags" {
  description = "(Required) A mapping of tags which should be assigned to this Virtual Machine."

  type     = map(string)
  nullable = false
}

variable "management_group" {
  description = "(Required) The VM's Management Group."

  type     = string
  nullable = false
}

variable "environment" {
  description = "(Required) The VM's Environment."

  type     = string
  nullable = false
}

variable "region" {
  description = "(Required) The VM's Azure Region."

  type     = string
  nullable = false
}

variable "critical_to_business_continuity" {
  description = "(Required) Is the VM critical to business continuity?"

  type     = string
  nullable = false
}

variable "purpose" {
  description = "(Required) The VM's reason to exist/purpose."

  type     = string
  nullable = false
}

variable "enable_ip_forwarding" {
  description = "(Optional) Should IP forwarding be enabled?"

  default  = true
  type     = bool
  nullable = false
}

variable "timezone" {
  description = "(Optional) Specifies the Time Zone which should be used by the Virtual Machine."

  default  = "Central Brazilian Standard Time"
  type     = string
  nullable = false
}


variable "key_vault_resource_group" {
  description = ""

  type     = string
  nullable = false
}

variable "data_disks" {
  description = "Managed Data Disks for azure viratual machine"
  type = list(object({
    name                 = string
    storage_account_type = string
    disk_size_gb         = number
  }))
  default = []
}

variable "enable_vm_availability_set" {
  description = "Manages an Availability Set for Virtual Machines."
  default     = false
}

variable "platform_fault_domain_count" {
  description = "Specifies the number of fault domains that are used"
  default     = 3
}

variable "platform_update_domain_count" {
  description = "Specifies the number of update domains that are used"
  default     = 5
}

variable "enable_proximity_placement_group" {
  description = "Manages a proximity placement group for virtual machines, virtual machine scale sets and availability sets."
  default     = false
}

variable "vm_availability_zone" {
  description = "The Zone in which this Virtual Machine should be created. Conflicts with availability set and shouldn't use both"
  default     = null
}
