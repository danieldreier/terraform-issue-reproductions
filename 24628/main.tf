provider "random" {}

resource "random_id" "bacon" {
  keepers     = { bacon = "tasty" }
  byte_length = 16
}

output "bacon" { value = random_id.bacon.hex }