provider "google" {
  credentials = file("credentials/dyl2-${var.environment}-terraform.json")
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

resource "google_dns_record_set" "zones" {
  name         = "${var.config["sbc"]["kamailio_tls_domain"]}."
  type         = "A"
  ttl          = 300
  managed_zone = var.dns_zone
  rrdatas      = [module.sbc.0.public_ip]
}

module "sbc" {
  source = "./sbc"
  hosts = var.hosts
}
