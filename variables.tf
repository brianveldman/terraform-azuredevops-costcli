variable "azure_tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
  nullable    = false
}

variable "azure_subscription_name" {
  type        = string
  description = "The Azure Subscription Name"
  nullable    = false
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
  nullable    = false
}

variable "azure_devops_org_name" {
  type        = string
  description = "The Azure DevOps Organization Name"
  nullable    = false
}

variable "azure_resourcegroup_name" {
  type        = string
  description = "The Azure Resource Group Name"
  default     = "rg-costcli-prod-westeu-001"
}

variable "azure_resourcegroup_location" {
  type        = string
  description = "The Azure Resource Group Location"
  default     = "West Europe"
}

variable "azure_devops_project_name" {
  type        = string
  description = "The Azure DevOps Project Name"
  default     = "Azure Cost CLI"
}

variable "azure_devops_service_connection_name" {
  type        = string
  description = "The Azure DevOps Service Connection Name"
  default     = "sc-costcli-wif" 
}
