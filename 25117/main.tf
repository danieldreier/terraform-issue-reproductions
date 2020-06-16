locals {
  network = data.google_compute_network.private_network.self_link
}

provider "google" {
  credentials = file("credentials/dyl2-${var.environment}-terraform.json")
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

provider "google-beta" {
  project = var.gcp_project
  region  = var.gcp_region
}

data "google_compute_network" "private_network" {
  provider = google-beta
  name     = "default"
  project  = var.gcp_project
}

data "google_service_account" "terraform" {
  project    = var.gcp_project
  account_id = var.service_account_id
}

provider "kubernetes" {
  version                = "1.10.0"
  host                   = google_container_cluster.primary.endpoint
  client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

provider "helm" {
  version = "~> 0.10"
  kubernetes {
    host = google_container_cluster.primary.endpoint
    client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
  }

  install_tiller  = "true"
  init_helm_home  = "true"
  debug           = "true"
}

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
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


