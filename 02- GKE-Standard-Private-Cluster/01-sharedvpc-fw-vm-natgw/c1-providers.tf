# Terraform Settings Block
terraform {
  required_version = ">= 1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.42.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-bucket"
    prefix = "prod/shared-vpc-vm-fw"
  }
}

# Terraform Provider Block
provider "google" {
  project = var.host_project_id
  region  = var.gcp_region_1
}