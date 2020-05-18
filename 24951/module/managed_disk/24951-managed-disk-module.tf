variable "resource_group" {
  description = "Resource group "
  type = object({
    location = string
    name     = string
  })
}

resource "azurerm_managed_disk" "managed_disk" {
  count = 1

  name                 = "test-managed-disk-${count.index}"
  location             = var.resource_group.location
  resource_group_name  = var.resource_group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 64
  zones                = [1]
}