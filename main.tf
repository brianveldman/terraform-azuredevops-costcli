resource "azuredevops_project" "costcli_project" {
  name               = var.azure_devops_project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Azure Cost CLI Project"
}


resource "azuredevops_git_repository" "costcli_repository" {
  project_id = azuredevops_project.costcli_project.id
  name       = "Azure Cost CLI Tests"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"

  }
}

resource "azuredevops_git_repository_file" "costcli_project_pipeline" {
  repository_id       = azuredevops_git_repository.costcli_repository.id
  file                = "azure-pipelines.yml"
  content             = templatefile("${path.module}/azure-pipelines.yml", {})
  branch              = "refs/heads/main"
  commit_message      = "Add Cost CLI pipeline"
  overwrite_on_create = false
}

resource "azuredevops_build_definition" "costcli_build" {
  project_id = azuredevops_project.costcli_project.id
  name       = "Azure Cost CLI Daily Tests"
  ci_trigger {
    use_yaml = true
  }
  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.costcli_repository.id
    branch_name = azuredevops_git_repository.costcli_repository.default_branch
    yml_path    = "azure-pipelines.yml"
  }
}

resource "azuredevops_variable_group" "costcli_vg" {
  project_id   = azuredevops_project.costcli_project.id
  name         = "vg-costs-cli"
  description  = "Variable group for Cost CLI"
  allow_access = true

  variable {
    name  = "subscriptionId"
    value = var.azure_subscription_id
  }

}

resource "azurerm_resource_group" "costcli_resourcegroup" {
  name     = var.azure_resourcegroup_name
  location = var.azure_resourcegroup_location
}

resource "azuredevops_serviceendpoint_azurerm" "costcli_service_connection" {
  project_id                             = azuredevops_project.costcli_project.id
  service_endpoint_name                  = var.azure_devops_service_connection_name
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  azurerm_spn_tenantid      = var.azure_tenant_id
  azurerm_subscription_id   = var.azure_subscription_id
  azurerm_subscription_name = var.azure_subscription_name
  description = "Service connection for Cost CLI"
  resource_group = azurerm_resource_group.costcli_resourcegroup.name
}

resource "azuredevops_pipeline_authorization" "costcli_authorization" {
  project_id = azuredevops_project.costcli_project.id
  resource_id = azuredevops_serviceendpoint_azurerm.costcli_service_connection.id
  type = "endpoint"
}
