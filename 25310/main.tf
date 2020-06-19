data "template_file" "foo" {
  template = "${file("./foo.tpl")}"
  vars = {
    foo = "foo"
  }
}

module "bar" {
  source = "./modules/bar"
}

output "foo" {
  value = data.template_file.foo.rendered
}

terraform {
  required_version = ">= 0.13"

  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1"
    }
  }
}

