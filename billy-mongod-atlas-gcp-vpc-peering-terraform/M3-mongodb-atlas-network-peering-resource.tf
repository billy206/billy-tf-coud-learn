# Resource - Create Network with Terraform for MongoDB Atlas
resource "mongodbatlas_network_container" "mongodb-atlas-network" {
  # MongoDB Atlas Project ID
  project_id = var.mongodb_atlas_project_id

  # MongoDB Network CIDR
  atlas_cidr_block = var.mongodb_atlas_cidr

  provider_name = var.mongodb_atlas_provider_name
}

# Resource - Create Network Peering of MongoDB Atlas Network to GCP VPC with Terraform
resource "mongodbatlas_network_peering" "mongodb-atlas-peering" {
  # MongoDB Atlas Project ID
  project_id = var.mongodb_atlas_project_id

  # MongoDB Atlas Network ID
  container_id = mongodbatlas_network_container.mongodb-atlas-network.container_id

  # MongoDB Atlas Provider Name
  provider_name = var.mongodb_atlas_provider_name

  gcp_project_id = data.terraform_remote_state.workspace.outputs.generic_project_id
  network_name   = data.terraform_remote_state.workspace.outputs.network_name
}