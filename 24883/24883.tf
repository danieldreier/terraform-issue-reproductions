locals {
    locations = toset(["a", "b"])
}

resource "local_file" "instance" {
    for_each = local.locations

    content  = each.value
    filename = "${path.module}/${each.value}.txt"
}

output "primary_filename" {
    value = local_file.instance["a"].filename
}
