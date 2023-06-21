# Create Cloud NAT Terraform Module
module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "4.0.0"

  # Cloud NAT Project Configuration
  project_id = var.project_id
  region     = var.gcp_region

  # Cloud NAT Basic Configuration
  router                             = module.cloud-router.router.name
  name                               = "${local.name}-${var.cloud_nat_name_suffix}"
  nat_ips                            = google_compute_address.nat-ip-address[*].id
  min_ports_per_vm                   = var.cloud_nat_min_ports_per_vm
  source_subnetwork_ip_ranges_to_nat = var.cloud_nat_source_subnetwork_ip_ranges_to_nat
  log_config_enable                  = var.cloud_nat_log_config_enable
  log_config_filter                  = var.cloud_nat_log_config_filter
}
