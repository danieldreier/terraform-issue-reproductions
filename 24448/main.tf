module "appservice" {
  source = "./appservice"

  regions = var.regions
  prefixs = var.prefixs
}