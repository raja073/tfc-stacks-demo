locals {
  name = "${var.prefix}-db-${var.suffix}"
}

resource "azurerm_resource_group" "main" {
  name     = local.name
  location = var.location
}

resource "azurerm_mysql_flexible_server" "main" {
  name                   = local.name
  location               = azurerm_resource_group.main.location
  resource_group_name    = azurerm_resource_group.main.name
  administrator_login    = "mradministrator"
  administrator_password = "P@ssw0rd12345!"
  sku_name               = "GP_Standard_D2ds_v4"

  tags = var.tags
}