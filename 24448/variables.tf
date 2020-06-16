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
  default = {
    northcentralus = {
      location = "northcentralus"
    }
  }
}

variable "prefixs" {
  type = map(object({
    prefix = string
  }))
  default = {
    northcentralus = {
      prefix = ""
    }
  }
}