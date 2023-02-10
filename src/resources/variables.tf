variable "vnet" {
  description = "description"

  type     = string
  nullable = false
}

variable "subnet" {
  description = "description"

  type     = string
  nullable = false
}

variable "subnet_resource_group" {
  description = "description"

  type     = string
  nullable = false
}

variable "resource_group" {
  description = "description"

  type     = string
  nullable = false
}

variable "tags" {
  description = "description"

  type     = map(string)
  nullable = false
}

variable "ip_configuration_name" {
  description = "description"

  type     = string
  nullable = false
}

variable "management_group" {
  description = "description"
  type        = string
  nullable    = false
}

variable "purpose" {
  description = "description"
  type        = string
  nullable    = false
}

variable "environment" {
  description = "description"
  type        = string
  nullable    = false
}

variable "region" {
  description = "description"
  type        = string
  nullable    = false
}

variable "critical_to_business_continuity" {
  description = "description"
  type        = string
  nullable    = false
}

variable "admin_password" {
  description = "(Required) ."
  type        = string
  nullable    = false
}

variable "key_vault_rbac_enable" {
  type        = bool
  description = "(Required) is this key vault using RBAC?"
  default     = false
}

variable "secret_domainadmin_name" {
  description = "(Required) ."
  type        = string
  nullable    = false
}

variable "key_vault_name" {
  description = "(Required) ."
  type        = string
  nullable    = false
}

variable "key_vault_name_rg" {
  description = "(Required) ."
  type        = string
  nullable    = false
}

variable "key_vault_secret_officer_group" {
  type        = string
  description = "(Required) Group with officer access in AVD's key vault secrets"
}

variable "key_vault_ip_rules" {
  type        = string
  description = "(Optional) Public IP from terraform's executioner to access key vault of this stack. After use, let this variable null"
  default     = null
}

variable "vm_identifier" {
  type        = string
  default     = null
}

variable "private_ip_address" {
  type        = string
  default     = null
}
