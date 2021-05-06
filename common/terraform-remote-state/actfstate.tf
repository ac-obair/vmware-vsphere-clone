resource azurerm_storage_container "ac-iac-platform-on-premises" {
  name                  = "ac-iac-platform-on-premises"
  storage_account_name  = data.azurerm_storage_account.actfstate.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "ac-iac-platform-platform-ops" {
  scope                = "${data.azurerm_storage_account.actfstate.id}/blobServices/default/containers/${azurerm_storage_container.ac-iac-platform-on-premises.id}"
  role_definition_name = "Owner"
  principal_id         = data.azuread_group.platform-ops.id
}