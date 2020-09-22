variable "y" {
  type = string
}

resource "random_pet" "pet" {
  prefix = var.y
}
