terraform {
  required_version = "~> 0.13.0"
#  experiments = [variable_validation]
}

provider "vsphere" {
  user           = "foo"
  password       = "bar"
  vsphere_server = "foo.example.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
  version = "~>1.16"
}
