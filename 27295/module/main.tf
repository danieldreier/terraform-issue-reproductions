terraform {
  experiments = [module_variable_optional_attrs]
}
variable "advanced_config" {
  type = map(object({
    transition = optional(set(object({
      days          = number
      storage_class = string
      date          = optional(string)
    })))
    expiration = optional(object({
      days                         = number
      date                         = optional(string)
      expired_object_delete_marker = optional(bool)
    }))
  }))
  default = {}
}

resource "aws_s3_bucket" "managed_bucket" {
  bucket = "name"
  region = "region"

  dynamic "lifecycle_rule" {
    for_each = var.advanced_config
    content {
      enabled = true
      id      = lifecycle_rule.key //replace(,"/[^\\w=.,@+-]/", "_")
      prefix  = lifecycle_rule.key
      dynamic "transition" {
        for_each = lifecycle_rule.value.transition != null ? lifecycle_rule.value.transition : toset([])
        iterator = t
        content {
          days          = t.value["days"]
          storage_class = t.value["storage_class"]
          date          = t.value["date"]
        }
      }
      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration != null ? [lifecycle_rule.value.expiration] : []
        iterator = e
        content {
          days                         = e.value["days"]
          date                         = e.value["date"]
          expired_object_delete_marker = e.value["expired_object_delete_marker"]
        }
      }
    }
  }

}
