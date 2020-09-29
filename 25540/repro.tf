provider "aws" {
  region = "us-east-1"
}

variable "users" {
  type        = list(string)
  default     = []
}

resource "aws_dynamodb_table_item" "this" {
  table_name = "table_name"
  hash_key   = "item"
  item = jsonencode({
    item = { S = "item_path" }
    parameters = { M = {
    users = { S = var.users }
      }
    }
  })
}
