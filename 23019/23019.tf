provider "local" {
  version = "1.4"
}
variable "cidr_block" {
  default = "10.128.0.0/16"
}
variable "the_list" {
  type = list
  default = [
    "a",
    "b",
    # uncomment this to crash
    #    "c",
  ]
}
module "subnets0" {
  source          = "hashicorp/subnets/cidr"
  version         = "1.0.0"
  base_cidr_block = cidrsubnet(var.cidr_block, 4, 8)
  networks = [
    for idx, az in var.the_list : {
      name     = az
      new_bits = 1
    }
  ]
}
resource "local_file" "f" {
  filename = "f.txt"
  content  = <<F
kaboom = ${join("\n", module.subnets0.networks[*].cidr_block)}
F
}
