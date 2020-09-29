// things in here can
module "modwithsubmodule" {
  source = "./modules/modwithsubmodule"
  count = 3
}

module "modwithoutsubmodule" {
  source = "./modules/modwithoutsubmodule"
  count = 1
}

// this can be tainted
resource "null_resource" "foo" {
  count = 1
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
