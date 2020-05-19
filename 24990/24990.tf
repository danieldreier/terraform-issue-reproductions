module "mymodule" {
    source = "./modules/mymodule"
}
resource "null_resource" "example" {
    for_each = {
        fizz = "buzz"
        foo = "bar"
    }
    provisioner "local-exec" {
        command = "echo hello ${each.key}"
    }
}