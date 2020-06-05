variable "email_address" {
  type    = string
  default = "Application <application@example.com>"
  validation {
    condition     = can(regex(".{4,20} <.+@example.com>", var.email_address))
    error_message = "A sentence with an accent é."
  }
}
