variable "newvpc_env_name"                  {}
variable "newvpc_cidr_blocks"               {}
variable "newvpc_env_internal_domainname"   {}


# this to set the default search name in /etc/resolv.conf to the internal domainname to use.
resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name          = var.newvpc_env_internal_domainname
  domain_name_servers  = ["AmazonProvidedDNS"]

  tags = {
    Name = "${var.newvpc_env_name}-dhcp-options"
  }
}


resource "aws_vpc" "terraform-vpc" {
    cidr_block           = var.newvpc_cidr_blocks[0]
    instance_tenancy     = "default"
    enable_dns_support   = "true"
    enable_dns_hostnames = "true"
    enable_classiclink   = "false"

    tags = {
        Name = var.newvpc_env_name
    }
}

#only add the second cidr if it is set
resource "aws_vpc_ipv4_cidr_block_association" "terraform-vpc_secondary-cidr" {
    count           = length(var.newvpc_cidr_blocks[1]) > 0 ? 1 : 0

    vpc_id          = aws_vpc.terraform-vpc.id
    cidr_block      = var.newvpc_cidr_blocks[1]
}


resource "aws_vpc_dhcp_options_association" "terraform-vpc-dhcp-options" {
  vpc_id            = aws_vpc.terraform-vpc.id
  dhcp_options_id   = aws_vpc_dhcp_options.vpc_dhcp_options.id
}


