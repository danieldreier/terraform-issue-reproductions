variable "study_code" {
  type        = string
  default     = null
}
output "study_code" {
  value = var.study_code
}
