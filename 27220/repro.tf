variable "first" {
  type      = object({prop = string})
  sensitive = true
  default   = {prop = "first"}
}

variable "second" {
  type      = object({prop = string})
  sensitive = true
  default   = {prop = "second"}
}

locals {
  properties     = [var.first, var.second]
  no_crash_local = merge(local.properties...)

  properties_copy = [for i in range(0, length(local.properties)) : local.properties[i]]
  crash_local     = merge(local.properties_copy...)
}
