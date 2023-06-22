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

# Resource - Create Private Endpoint of MongoDB Atlas Network
resource "mongodbatlas_privatelink_endpoint" "mongodb-atlas-private_endpoint" {
  # MongoDB Atlas Project ID
  project_id = var.mongodb_atlas_project_id

  # MongoDB Atlas Provider Name
  provider_name = var.mongodb_atlas_provider_name

  # MongoDB Atlas Provider Region Name
  region = var.mongodb_atlas_provider_region_name
}
