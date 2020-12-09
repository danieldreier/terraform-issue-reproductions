module "study" {
  source = "./study"
}

output "test" {
  value = module.study
}
