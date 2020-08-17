locals {
  rt53 = {
    is_local = (var.rt53.local.private_zone_name == null) ? 0 : 1
  }
}

resource "random_string" "this" {
  length = 5 + local.rt53.is_local
}
