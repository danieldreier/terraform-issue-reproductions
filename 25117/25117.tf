resource "google_dns_record_set" "zones" {
  name         = "${var.config["sbc"]["kamailio_tls_domain"]}."
  type         = "A"
  ttl          = 300
  managed_zone = var.dns_zone
  rrdatas      = [module.sbc.0.public_ip]
}
