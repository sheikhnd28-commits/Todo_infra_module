 variable "nic" {
    type = map(object({

  name                = string
  location            = string
  resource_group_name = string
  virtual_network_name = string
  pip_name =             string
  subnet_name =          string
   ip_configuration   =   map(object({
    
    name                          = string
    subnet_id                     = string
    private_ip_address_allocation = string 
    public_ip_address_id          = string
    
    }))}
    ))
    }
    
 
  
 