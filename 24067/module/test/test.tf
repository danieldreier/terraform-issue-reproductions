variable "components" {
  type    = map(map(any))
  default = { kv = {} }
}

locals {
  kv_enabled   = length([for i, j in var.components : 1 if i == "kv"]) > 0 ? true : false
  pki_enabled  = length([for i, j in var.components : 1 if i == "pki"]) > 0 ? true : false
  pki_settings = lookup(var.components, "pki", {})
}

data "vault_policy_document" "pki_read_policy" {
  count = local.pki_enabled ? 1 : 0

  dynamic "rule" {
    for_each = length(lookup(local.pki_settings, "domains", [])) > 0 ? toset(["enabled"]) : toset([])

    content {
      path         = "pki/certs/*"
      capabilities = ["list"]
      description  = "List certs"
    }
  }
}

output "policy" {
  value = data.vault_policy_document.pki_read_policy.0.hcl
}
