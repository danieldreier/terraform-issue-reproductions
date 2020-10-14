variable newvpc_vpc_id					{}
variable newvpc_internetgateway_name    {}


resource "aws_internet_gateway" "igw" {
	vpc_id 		= var.newvpc_vpc_id

	tags = {
		Name = var.newvpc_internetgateway_name
	}
}
