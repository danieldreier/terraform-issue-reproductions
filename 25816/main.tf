provider "aws" {
  region = "us-west-2"
}

module "test_module" {
  source = "./test_module"
  regions = var.regions
}

variable "regions" {
  default = ["us-west-2", "us-east-1"]
}
