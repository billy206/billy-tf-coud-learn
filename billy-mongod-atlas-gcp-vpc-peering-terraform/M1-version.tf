# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.27"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.10"
    }
  }
}

# Terraform Provider Block
provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}
