# Resource - Create Network with Terraform for MongoDB Atlas
# resource "mongodbatlas_network_container" "mongodb-atlas-network" {
#   # MongoDB Atlas Project ID
#   project_id = var.mongo_atlas_project_id

#   # MongoDB Network CIDR
#   atlas_cidr_block = "10.8.0.0/18"

#   provider_name = "GCP"
# }

# Resource - Create Network Peering of MongoDB Atlas Network to GCP VPC with Terraform
# resource "mongodbatlas_network_peering" "test" {
#   # MongoDB Atlas Project ID
#   project_id     = var.project_id

#   # MongoDB Atlas Network ID
#   container_id   = mongodbatlas_network_container.test.container_id

#   provider_name  = "GCP"
#   gcp_project_id = var.gcpprojectid
#   network_name   = "default"
# }
