
rg_name = {
  rg1 = {
    name     = "sonu1234"
    location = "UAE North"
  }
}





vnet = {
  v2 = {
    name                = "test_vnet1"
    location            = "UAE North"
    resource_group_name = "sonu1234"
    address_space       = ["10.0.0.0/16"]


    subnet = {
      s1 = {
        name             = "frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }

  v2 = {
    name                = "test_vnet1"
    location            = "UAE North"
    resource_group_name = "sonu1234"
    address_space       = ["10.0.0.0/16"]


    subnet = {
      s2 = {
        name             = "backend_subnet"
        address_prefixes = ["10.0.0.0/24"]
      }
    }
  }
}

pip = {
  publicip1 = {
    name                = "pip123"
    resource_group_name = "sonu1234"
    location            = "UAE North"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    name                 = "nicv23"
    location             = "UAE North"
    resource_group_name  = "sonu1234"
    virtual_network_name = "test_vnet1"
    pip_name             = "pip123"
    subnet_name          = "backend_subnet"
    ip_configuration = {
      nic12 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        subnet_id                     = "backend_subnet"
        public_ip_address_id          = "pip123"
      }
    }

  }
}

nsg = {
  nsg1 = {
    name                = "nsg1234"
    location            = "UAE North"
    resource_group_name = "sonu1234"

    security_rule = {
      rule1 = {
        name                       = "Allow_HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    }
  }
}

vmss = {
  vmss1 = {
    name                   = "dev-nvm-001"
    location               = "UAE North"
    network_interface_name = "nicv23"
    resource_group_name    = "sonu1234"
    # network_interface_ids = ["${module.nic.nic["nic1"].id}"]
    # size                            = "Standard_B1s"
    size                            = "Standard_D2s_v3"
    admin_username                  = "azureuser"
    admin_password                  = "Password1234!"
    disable_password_authentication = false

    os_disk = {
      os_disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

    }
    source_image_reference = {
      sir1 = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }

    }
  }
}

sql_server = {
  mserver1 = {
    name                         = "mssqlserver1234"
    resource_group_name          = "sonu1234" # ✅ FIXED
    location                     = "UAE North"
    version                      = "12.0"
    administrator_login          = "missadministrator"
    administrator_login_password = "thisIsKat11"
    minimum_tls_version          = "1.2"
  }
}

servers = {
  sql2 = {
    name                         = "mssqlserver1234"
    resource_group_name          = "sonu1234" 
    location                     = "UAE North"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "Password@123"
    minimum_tls_version          = "1.2"

  }
}

sqldb = {
  db2 = {
    name                = "sqldb-dev-013"
    resource_group_name = "sonu1234" 
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    server_name         = "mssqlserver1234"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    # read_scale          = "true"
    sku_name            = "S0"
    # zone_redundant      = "true"
    enclave_type        = "VBS"
  }
}
