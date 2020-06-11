variable "virtual_networks" {
  description = "The virtual networks with their properties."
  type = list(object({
    id            = string
    address_space = list(string)
    subnets       = any
  }))
  default = [
  {
    id            = "1"
    address_space = ["10.0.0.0/16"]
    subnets = [
      {
        name           = "test1"
        address_prefix = "10.0.0.0/24"
      },
      {
        name                     = "test2"
        address_prefix           = "10.0.1.0/24"
        security_group_iteration = "0"
      },
      {
        name           = "AzureBastionSubnet"
        address_prefix = "10.0.2.0/27"
      },
    ]
  },
  {
    id            = "2"
    address_space = ["10.1.0.0/16"]
    subnets = [
      {
        name                     = "test1"
        address_prefix           = "10.1.0.0/24"
        security_group_iteration = "0"
      },
    ]
  },
]
}
