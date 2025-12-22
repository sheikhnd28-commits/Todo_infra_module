variable "vmss" {
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        size                = string
        admin_username      = string
        admin_password      = string
        disable_password_authentication = bool
            network_interface_name = string
        os_disk = optional(map(object({ 
            caching              = string
            storage_account_type = string
        })))
        source_image_reference = optional(map(object({
            publisher = string
            offer     = string
            sku       = string
            version   = string
        })))
    }))
}