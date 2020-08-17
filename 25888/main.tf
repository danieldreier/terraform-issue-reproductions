module "vpc" {
  source = "./modules/vpc"
  rt53 = var.rt53
}
