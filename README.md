# Terraform Module for Deploying Azure Cost CLI

This Terraform module helps you set up Azure Cost CLI in Azure DevOps and automates the execution of cost reports. 🔥

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 1.10.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.10.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_build_definition.costcli_build](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/build_definition) | resource |
| [azuredevops_git_repository.costcli_repository](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/git_repository) | resource |
| [azuredevops_git_repository_file.costcli_project_pipeline](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/git_repository_file) | resource |
| [azuredevops_pipeline_authorization.costcli_authorization](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/pipeline_authorization) | resource |
| [azuredevops_project.costcli_project](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/project) | resource |
| [azuredevops_serviceendpoint_azurerm.costcli_service_connection](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/serviceendpoint_azurerm) | resource |
| [azuredevops_variable_group.costcli_vg](https://registry.terraform.io/providers/microsoft/azuredevops/1.10.0/docs/resources/variable_group) | resource |
| [azurerm_resource_group.costcli_resourcegroup](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.cost_management_reader](https://registry.terraform.io/providers/hashicorp/azurerm/4.35.0/docs/resources/role_assignment) | resource |
| [azuread_service_principal.cost_ado_sp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_devops_org_name"></a> [azure\_devops\_org\_name](#input\_azure\_devops\_org\_name) | The Azure DevOps Organization Name | `string` | n/a | yes |
| <a name="input_azure_devops_project_name"></a> [azure\_devops\_project\_name](#input\_azure\_devops\_project\_name) | The Azure DevOps Project Name | `string` | `"Azure Cost CLI"` | no |
| <a name="input_azure_devops_service_connection_name"></a> [azure\_devops\_service\_connection\_name](#input\_azure\_devops\_service\_connection\_name) | The Azure DevOps Service Connection Name | `string` | `"sc-costcli-wif"` | no |
| <a name="input_azure_resourcegroup_location"></a> [azure\_resourcegroup\_location](#input\_azure\_resourcegroup\_location) | The Azure Resource Group Location | `string` | `"West Europe"` | no |
| <a name="input_azure_resourcegroup_name"></a> [azure\_resourcegroup\_name](#input\_azure\_resourcegroup\_name) | The Azure Resource Group Name | `string` | `"rg-costcli-prod-westeu-001"` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | The Azure Subscription ID | `string` | n/a | yes |
| <a name="input_azure_subscription_name"></a> [azure\_subscription\_name](#input\_azure\_subscription\_name) | The Azure Subscription Name | `string` | n/a | yes |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | The Azure Tenant ID | `string` | n/a | yes |

## Outputs

No outputs.

## Contributors
- Original author: [Brian Veldman](https://www.linkedin.com/in/brian-veldman/) | Technology Enthusiast
