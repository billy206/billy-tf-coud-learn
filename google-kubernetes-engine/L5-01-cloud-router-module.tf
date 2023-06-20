# Create Cloud Router Terraform Module
module "cloud-router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "5.0.1"

  # Cloud Router Project Configuration
  project = var.project_id
  region  = var.gcp_region

  # Cloud Router Basic Configuration
  network = module.vpc.network_name
  name    = "${local.name}-router"
}

