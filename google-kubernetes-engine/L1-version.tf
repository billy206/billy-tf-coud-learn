# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.27"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = var.project_id
  region  = var.gcp_region
}
