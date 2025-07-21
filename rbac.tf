data "azuread_service_principal" "cost_ado_sp" {
  client_id = azuredevops_serviceendpoint_azurerm.costcli_service_connection.service_principal_id
}

resource "azurerm_role_assignment" "cost_management_reader" {
  scope                = "/subscriptions/${var.azure_subscription_id}"
  role_definition_name = "Cost Management Reader"
  principal_id         = data.azuread_service_principal.cost_ado_sp.object_id
}
