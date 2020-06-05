terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "terraform-providers/google-beta"
    }
  }
}

provider "google" {
  version = "~> 3.3"
}

provider "google-beta" {
  version = "~> 3.3"
}
