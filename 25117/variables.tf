variable "environment" {}
variable "gcp_project" {}
variable "gcp_region" {}
variable "gcp_zone" {}
variable "dns_zone" {}
variable "service_account_id" {}
variable "config" {
    type = map(map(string))
}

variable "hosts" {
    type = list(map(string))
}
