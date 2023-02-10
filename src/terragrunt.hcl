terraform {
  source = "..//resources"
}

remote_state {
  backend = "azurerm"

  config = {
    key                  = "${path_relative_to_include()}.tfstate"
    resource_group_name = "abp1rgsobr1crfnc001"
    storage_account_name = "abprbrrestore"

    container_name       = "tfstate"
  }
}
terraform_version_constraint = "~> 1.3.0"

terragrunt_version_constraint = ">= 0.38.0"

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = "~> 1.2"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.41.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
     }
  }
}
EOF
}
