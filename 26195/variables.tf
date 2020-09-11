variable "subnet_details" {
  type        = map
  description = "Subnet Details"
  default = {
    "subnet1" = {
      "name"                    = "subnet1"
      "address_space"           = "172.16.0.0/16"
      "nsg_name"                = "subnet1-nsg"
      "service_delegation_name" = null
      "service_actions"         = null
      "subnet_nsg_rules" = [
        {
          name                                       = "allow_outbound_internet_80"
          description                                = "Allow internet access to HTTP "
          priority                                   = "100"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "Internet"
          destination_port_range                     = 80
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_outbound_internet_443"
          description                                = "Allow internet access to HTTPS "
          priority                                   = "101"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "Internet"
          destination_port_range                     = 443
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_outbound_internet_123"
          description                                = "Allow internet access to NTP "
          priority                                   = "102"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Udp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "Internet"
          destination_port_range                     = 123
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_windows_activcation"
          description                                = "allow_windows_activcation "
          priority                                   = "103"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "23.102.135.246/32"
          destination_port_range                     = "*"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_postgres_access"
          description                                = "allow_postgres_access "
          priority                                   = "104"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "sql.eastus2"
          destination_port_range                     = "5432"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_internal_vnet_access"
          description                                = "allow_intervnet_access"
          priority                                   = "105"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "172.16.0.0/16"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "172.16.0.0/16"
          destination_port_range                     = null
          destination_port_ranges                    = ["10000","18092","8092","9083"]
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_databricks_vnet_access"
          description                                = "allow_databricks_access"
          priority                                   = "901"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "172.16.0.0/16"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "172.20.0.0/16"
          destination_port_range                     = "*"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "disable_vnet_access"
          description                                = "Disable Vnet Acess"
          priority                                   = "4000"
          direction                                  = "Outbound"
          access                                     = "Deny"
          protocol                                   = "*"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "VirtualNetwork"
          destination_port_range                     = "*"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "disable_internet_access"
          description                                = "Disable internet Acess"
          priority                                   = "4001"
          direction                                  = "Outbound"
          access                                     = "Deny"
          protocol                                   = "*"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "Internet"
          destination_port_range                     = "*"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        }
      ]
    },
    "appgwy-sn" = {
      "name"                    = "appgwy-sn"
      "address_space"           = "172.32.255.0/24"
      "nsg_name"                = "appgwy-sn-nsg"
      "service_delegation_name" = null
      "service_actions"         = null
      "subnet_nsg_rules" = [
        {
          name                                       = "ALLOW-GATEWAYMANAGER-IN"
          description                                = "ALLOW-GATEWAYMANAGER-IN"
          priority                                   = "100"
          direction                                  = "Inbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "GatewayManager"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "*"
          destination_port_range                     = "65200-65535"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_http_80_443_in"
          description                                = "allow_http_80_443_in"
          priority                                   = "101"
          direction                                  = "Inbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "AzureFrontDoor.Backend"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "172.32.255.0/24" #entire subnet
          destination_port_range                     = null
          destination_port_ranges                    = 80
          destination_application_security_group_ids = null
        },
        {
          name                                       = "allow_https_443_in"
          description                                = "allow_https_443_in"
          priority                                   = "102"
          direction                                  = "Inbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "AzureFrontDoor.Backend"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "172.32.255.0/24" #entire subnet
          destination_port_range                     = 443
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {  ###### NOW OUTBOUND RULES ####################
          name                                       = "allow_http_80_out"
          description                                = "allow_http_80_out "
          priority                                   = "100"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "VirtualNetwork"
          destination_port_range                     = "80"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        },
        {  
          name                                       = "allow_http_443_out"
          description                                = "allow_http_443_out "
          priority                                   = "101"
          direction                                  = "Outbound"
          access                                     = "Allow"
          protocol                                   = "Tcp"
          source_port_range                          = "*"
          source_port_ranges                         = null
          source_address_prefix                      = "VirtualNetwork"
          source_application_security_group_ids      = null
          destination_address_prefix                 = "VirtualNetwork"
          destination_port_range                     = "443"
          destination_port_ranges                    = null
          destination_application_security_group_ids = null
        }
      ]
    }
  }
}