# Resource - Create Network with Terraform for MongoDB Atlas
resource "mongodbatlas_network_container" "mongodb-atlas-network" {
  # MongoDB Atlas Project ID
  project_id = var.mongodb_atlas_project_id
  # MongoDB Network CIDR
  atlas_cidr_block = var.mongodb_atlas_cidr
  provider_name    = "GCP"
}

# Resource - Create Network Peering of MongoDB Atlas Network to GCP VPC with Terraform
resource "mongodbatlas_network_peering" "mongodb-atlas-peering" {
  # MongoDB Atlas Project ID
  project_id = var.mongodb_atlas_project_id

  # MongoDB Atlas Network ID
  container_id = mongodbatlas_network_container.mongodb-atlas-network.container_id

  provider_name  = "GCP"
  gcp_project_id = var.gcp_project_id
  network_name   = "ldpro-dev-vpc"
}

data "google_compute_network" "vpc" {
  name = "ldpro-dev-vpc"
}

resource "google_compute_network_peering" "vpc-peering" {
  name = "ldpro-dev-route-to-mongo-atlas"
  # TODO
  network = data.google_compute_network.vpc.self_link
  # The URI of the Atlas VPC
  peer_network = "https://www.googleapis.com/compute/v1/projects/${mongodbatlas_network_peering.mongodb-atlas-peering.atlas_gcp_project_id}/global/networks/${mongodbatlas_network_peering.mongodb-atlas-peering.atlas_vpc_name}"
}
