# Resource - Create External IP Address with Terraform for Cloud NAT
resource "google_compute_address" "nat-ip-address" {
  region = var.gcp_region

  address_type = var.nat_ip_address_type
  network_tier = var.nat_ip_address_network_tier

  count = 7
  name  = "${local.name}-${var.nat_ip_name_suffix}-${count.index}"

  lifecycle {
    prevent_destroy = false
  }
}

# Resource - Create IP Range for Database Private Service Connection (PSC) Address
resource "google_compute_global_address" "psc-database-ip-range" {
  provider = google-beta
  project  = var.project_id

  name          = "${local.name}-${var.psc_database_subnet_name_suffix}"
  address_type  = var.psc_database_ip_address_type
  ip_version    = var.psc_database_ip_address_version
  purpose       = var.psc_database_ip_address_purpose
  network       = module.vpc.network_id
  prefix_length = var.psc_database_ip_address_prefix_length
  address       = var.psc_database_subnet_cidr
}


