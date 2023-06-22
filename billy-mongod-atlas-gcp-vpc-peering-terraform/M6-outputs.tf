############################################
# MongoDB Atlas Outputs Variables
############################################

output "mongodb_atlas_connection_string" {
  description = "TODO"
  value       = mongodbatlas_cluster.cluster.connection_strings
}

output "mongodb_atlas_network" {
  description = "TODO"
  value       = mongodbatlas_network_container.mongodb-atlas-network.container_id
}

output "mongodbatlas_network_peering" {
  description = "TODO"
  value       = mongodbatlas_network_peering.mongodb-atlas-peering
}

############################################
# GCP Outputs Variables
############################################

output "billy_test" {
  description = "TODO"
  value       = data.google_compute_network.vpc
}

output "google_compute_network_peering" {
  description = "TODO"
  value       = google_compute_network_peering.vpc-peering
}
