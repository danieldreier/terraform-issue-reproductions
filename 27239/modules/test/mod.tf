variable "projects" {
  type = list(string)
}

variable "config" {
  type = map(object({
    token = string
  }))
}

resource "null_resource" "project" {
  for_each = { for e in setproduct(var.projects, keys(var.config)) : "${e[0]}-${e[1]}" => e }
  # do something with token here
}
