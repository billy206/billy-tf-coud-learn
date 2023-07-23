# # Create Private Service Connection for Database PSC IP Range
resource "google_service_networking_connection" "psc-db-service" {
  depends_on              = [module.vpc]
  network                 = module.vpc.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["${local.name}-${var.psc_database_subnet_name_suffix}"]
}
