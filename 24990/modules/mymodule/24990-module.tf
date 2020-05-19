resource "null_resource" "example-in-module" {
    for_each = {
        fizz = "buzz"
        foo = "bar"
    }
    provisioner "local-exec" {
        command = "echo hello ${each.key}"
    }
}