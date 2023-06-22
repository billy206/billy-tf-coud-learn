############################################
# MongoDB Atlas Outputs Variables
############################################

output "mongodb_atlas_plt-cluster_connection_string" {
  description = "The connection strings of the MongoDB Atlas server"
  value       = mongodbatlas_cluster.plt-cluster.connection_strings
}

output "mongodb_atlas_network" {
  description = "The Network of the MongoDB Atlas"
  value       = mongodbatlas_network_container.mongodb-atlas-network.container_id
}

output "mongodb_atlas_network_peering" {
  description = "The Peering of the MongoDB Atlas Network"
  value       = mongodbatlas_network_peering.mongodb-atlas-peering
}

############################################
# GCP Outputs Variables
############################################

output "google_compute_network_peering" {
  description = "The Peering of the GCP Network"
  value       = google_compute_network_peering.gcp-vpc-peering
}
