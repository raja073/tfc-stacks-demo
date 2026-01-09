locals {
  name = "${var.prefix}-vm-${var.suffix}"
}

resource "azurerm_resource_group" "main" {
  name     = local.name
  location = var.location

  tags = var.tags
}

resource "azurerm_network_interface" "main" {
  name                = "${local.name}-nic1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "${local.name}-ipconfig1"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "random_password" "admin_password" {
  length  = 16
  special = true
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = local.name
  location                        = azurerm_resource_group.main.location
  resource_group_name             = azurerm_resource_group.main.name
  size                            = var.vm_sku_size
  admin_username                  = "azureuser"
  admin_password                  = random_password.admin_password.result
  disable_password_authentication = false
  zone                            = var.vm_zone

  network_interface_ids = [
    azurerm_network_interface.main.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  tags = var.tags
}