resource "azurerm_role_assignment" "ra1" {
  scope                = "${var.subnet_ids["${var.aks_map["subnet_name"]}"]}"
  role_definition_name = "Network Contributor"
  principal_id         = "${var.service_principal_map["object_id"]}"
}

resource "azurerm_role_assignment" "ra2" {
  scope                = "${var.user_msi_map["id"]}"
  role_definition_name = "Managed Identity Operator"
  principal_id         = "${var.service_principal_map["object_id"]}"
}

resource "azurerm_role_assignment" "ra3" {
  scope                = "${var.subnet_ids["${var.appgw_subnet_name}"]}"
  role_definition_name = "Contributor"
  principal_id         = "${var.user_msi_map["principal_id"]}"
}

resource "azurerm_role_assignment" "ra4" {
  scope                = "${var.resource_group_id}"
  role_definition_name = "Reader"
  principal_id         = "${var.user_msi_map["principal_id"]}"
}