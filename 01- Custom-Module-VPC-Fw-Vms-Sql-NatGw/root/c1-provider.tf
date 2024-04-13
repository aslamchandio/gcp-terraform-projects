terraform {
  required_version = "~> 1.8.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      #version = "5.21.0"
      version = "~> 5.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~>4"
      #version = "~> 5.0"
    }
  }
}


provider "google" {
  # Configuration options
  #credentials = file("~/devops-by-example-9004d3b359f5.json")
  project = var.project_id
  region  = var.gcp_region
}