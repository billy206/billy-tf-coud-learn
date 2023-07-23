# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "7.0.0"

  # VPC Project Configuration
  project_id   = var.project_id
  network_name = "${local.name}-${var.vpc_name_suffix}"

  # VPC Basic Configuration
  mtu          = var.vpc_mtu
  routing_mode = var.vpc_routing_mode

  subnets = [
    {
      subnet_name   = "${local.name}-${var.network_subnet_name_suffix}"
      subnet_ip     = var.network_subnet_ip
      subnet_region = var.gcp_region
    }
  ]

  secondary_ranges = {
    "${local.name}-${var.network_subnet_name_suffix}" = [
      {
        range_name    = "${local.name}-${var.network_secondary_range_pod_suffix}"
        ip_cidr_range = var.network_subnet_secondary_range_pod_ip
      },
      {
        range_name    = "${local.name}-${var.network_secondary_range_service_suffix}"
        ip_cidr_range = var.network_subnet_secondary_range_service_ip
      },
    ]
  }
}
