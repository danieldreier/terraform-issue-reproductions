variable "regions" {}

module "test_module2" {
  count = length(var.regions)
  source = "./test_module2"
}

