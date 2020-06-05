provider "aws" {
  region              = "us-east-1"
  version             = "~> 2.46"
}

module "test" {
  source              = "./modules/test"
  name                = "test"
  vpc_azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_cidr            = "10.1.0.0/16"
  vpc_public_subnets  = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
  vpc_private_subnets = ["10.1.100.0/22", "10.1.104.0/22", "10.1.108.0/22"]
}
