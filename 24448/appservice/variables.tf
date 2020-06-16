# variable "prefix" {
#   description = "The prefix used for all resources in this example"
# }

# variable "location" {
#   description = "The Azure location where all resources in this example should be created"
# }

variable "regions" {
  type = map(object({
    location = string
  }))
}

variable "prefixs" {
  type = map(object({
    prefix = string
  }))
}