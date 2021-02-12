locals {
    outgoing  = join(",", ["172.217.13.174:80","74.6.231.20:80"])
}
data "template_file" "init" {
  template = file("./script.sh")
  vars = {
    outgoing = local.outgoing
  }
}

output "out" {
    value = data.template_file.init.rendered
}