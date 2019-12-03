locals {
  resource_group = var.create_resource_group ? azurerm_resource_group.rg[0].name : var.resource_group_name
  name           = length("${random_pet.kv_prefix.id}-${var.resource_group_name}-kv") <= 24 ? "${random_pet.kv_prefix.id}-${var.resource_group_name}-kv" : "${random_pet.kv_prefix.id}-${substr(terraform.workspace, 0, 10)}-kv"
}