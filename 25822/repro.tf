terraform {
  backend "local" {}
}

terraform {
  required_providers {
    google = {
      version = "~> 3.33.0"
    }
    kubernetes = {
      version = "~> 1.12.0"
    }
    random = {
      version = "~> 2.3.0"
    }
  }
}
