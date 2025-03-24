terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.20.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.10.0"
    }
  }
  required_version = "~> 1.11.0"
}