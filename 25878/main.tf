module "foo" {
  source = "./module"

  should_create = true
}

output "normal" {
  value = module.foo.normal
}

output "count" {
  value = module.foo.count
}

output "for_each" {
  value = module.foo.for_each
}