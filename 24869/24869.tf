variable "base_cidr_block" {
  type = string
  default = "10.0.0.0/10"
}

locals {
        cidr_num = tonumber(regex("/(\\d+)",var.base_cidr_block)[0])
        // TODO: Add validation to prevent networks larger than /21. cidr_num < 21
        small_subnet_bits = 26-local.cidr_num
        service_subnet_bits = 24-local.cidr_num
        subnet_array = cidrsubnets(var.base_cidr_block, 
                local.small_subnet_bits,
                local.small_subnet_bits,
                local.small_subnet_bits,
                local.small_subnet_bits,
                local.service_subnet_bits, 
        )
        //Need to generate an array with the remaining IP ranges from the base_cidr_block
        // 10.0.0.0/20 will lose from 10.0.0.0 to 10.0.1.255 for first 5 subnets
        // need to assign 10.0.3.0 to 10.0.15.255 to Private
      
        // Array that contains the number of "newbits" for all /24 within up to a /20 CIDR range (Azure doesnt recommend CIDRs larger than /21)
        // This array will be reduced down based on the size of the CIDR range.
        slicer_array = [
                local.service_subnet_bits,
                local.service_subnet_bits,
                local.service_subnet_bits,
                local.service_subnet_bits,
                local.service_subnet_bits,
                local.service_subnet_bits,
                local.service_subnet_bits,
                local.service_subnet_bits]

        exponent = 24 - local.cidr_num - 1     // value is 2
        slash_count = pow(2,local.exponent)    // doesnt work

        // Generate all /24 networks within the base_cidr_block
        # all_24 = cidrsubnets(var.base_cidr_block, slice(local.slicer_array,0,pow(2,2))...)  //works
        all_24 = cidrsubnets(var.base_cidr_block, slice(local.slicer_array,0,local.slash_count)...)  //works

        // Remove the first two since they are used by the other 5 subnets (4x /26 and 1x /24)
        // Effectively, the first /23 gets chewed up. I want to take all the remaining /24 and allocated to the larger subnet.
        sub_all_24 = slice(local.all_24,2, local.slash_count )

}
