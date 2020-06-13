module "foo" {
  source = "../foo"
}

output "s3region" {
  value = lookup(local.s3region, module.foo.foo_content)
}

output "s3bucket" {
  value = lookup(local.s3bucket, module.foo.foo_content)
}

output "name" {
  value = lookup(local.name, module.foo.foo_content)
}

