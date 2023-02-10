<!-- BEGIN_TF_DOCS -->
# Terraform Azure Stack: Template

Stack used as template for creating other Azure Terraform Stacks.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_template"></a> [template](#module\_template) | git@github.com:BancoArbi/terraform-azurerm-module-template.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) A map of tags to be applied to the resources. | `map(string)` | n/a | yes |
<!-- END_TF_DOCS -->