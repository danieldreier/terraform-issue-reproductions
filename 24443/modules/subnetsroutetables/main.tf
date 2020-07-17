
variable "newvpc_vpc_id"						{}
variable "newvpc_ws1_subnet_cidr_block"			{}
variable "newvpc_ws2_subnet_cidr_block"			{}

variable "newvpc_ws1_subnet_name"				{}
variable "newvpc_ws2_subnet_name"				{}

variable "newvpc_aws_availibility_zone1_long" {}
variable "newvpc_aws_availibility_zone2_long" {}


variable "newvpc_gateway_id"                    {}
variable "newvpc_public_routetable_name"        {}

# subnets

resource "aws_subnet" "sn_ws1" {
	vpc_id 					= var.newvpc_vpc_id
	cidr_block 				= var.newvpc_ws1_subnet_cidr_block
	map_public_ip_on_launch = "true"
	availability_zone 		= var.newvpc_aws_availibility_zone1_long

	tags = {
		Name = var.newvpc_ws1_subnet_name
	}
}

resource "aws_subnet" "sn_ws2" {
	vpc_id 					= var.newvpc_vpc_id
	cidr_block 				= var.newvpc_ws2_subnet_cidr_block
	map_public_ip_on_launch = "true"
	availability_zone 		= var.newvpc_aws_availibility_zone2_long

	tags = {
		Name = var.newvpc_ws2_subnet_name
	}
}


# the route tables

resource "aws_route_table" "rt_public" {
    vpc_id                  = var.newvpc_vpc_id

    route {
        cidr_block          = "0.0.0.0/0"
        gateway_id          = var.newvpc_gateway_id
    }

    tags = {
        Name = var.newvpc_public_routetable_name
    }
}
