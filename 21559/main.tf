module "ue1" {
  source = "./modules/ue1"
}

module "uw2" {
  source = "./modules/uw2"
}

output "result" {
  value = {
    ue1: module.ue1.core,
    uw2: module.uw2.core,
  }
}
