resource "azurerm_linux_virtual_machine" "vmss" {
    for_each = var.vmss
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids =[
  data.azurerm_network_interface.nic[each.key].id
]
  

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  dynamic "os_disk" {
    for_each =  each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
   
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
   
  }
}