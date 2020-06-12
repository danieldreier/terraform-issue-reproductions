module "foo" {
  source = "./module"
  name   = "some-value-2"
}

data "null_data_source" "data_in_root" {
  inputs = {
    id = module.foo.id
  }
}

resource "null_resource" "resource_in_root" {
  triggers = data.null_data_source.data_in_root.outputs
}
