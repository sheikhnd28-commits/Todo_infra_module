module "rg_name" {
  source = "../../module/Resourse_group"
  rg     = var.rg_name
}

module "vnet" {
  source     = "../../module/vnet"
  depends_on = [module.rg_name]
  vnet       = var.vnet
}

module "pip" {
  source     = "../../module/Pip"
  depends_on = [module.rg_name, module.vnet]
  pip        = var.pip
}


module "nic" {
  source     = "../../module/network_interface"
  depends_on = [module.rg_name, module.vnet, module.pip]
  nic        = var.nic
}

module "nsg" {
  source     = "../../module/azurem_network_sequrity"
  depends_on = [module.rg_name, module.vnet, module.pip, module.nic]
  nsg        = var.nsg
}

module "vmss" {
  source     = "../../module/Virtual_machine"
  depends_on = [module.rg_name, module.nic, module.nsg, module.vnet]
  vmss       = var.vmss
}

module "sql_server" {
  source     = "../../module/Azurem_sql_server"
  depends_on = [module.rg_name]
  sql_server = var.sql_server
}

module "sqldb" {
  source     = "../../module/Azurem_sql_database"
  depends_on = [ module.rg_name , module.sql_server ]
  sqldb     = var.sqldb
}