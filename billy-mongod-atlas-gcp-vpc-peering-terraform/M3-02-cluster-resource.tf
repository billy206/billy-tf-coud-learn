# data "terraform_remote_state" "workspace" {
#   backend = "remote"

#   config = {
#     organization = "billy-test-tf"
#     workspaces = {
#       name = "gke-billy-tf-coud-learn"
#     }
#   }
# }

# locals {
#   name = data.terraform_remote_state.workspace.outputs.local_name

#   project_id = data.terraform_remote_state.workspace.outputs.generic_project_id
#   region     = data.terraform_remote_state.workspace.outputs.generic_gcp_region

#   product_name = data.terraform_remote_state.workspace.outputs.generic_product_name
#   environment  = data.terraform_remote_state.workspace.outputs.generic_environment

#   private_network = data.terraform_remote_state.workspace.outputs.network_id

#   # Replica IP Configuration
#   read_replica_ip_configuration = {
#     ipv4_enabled        = var.cloud_sql_ipv4_enabled
#     require_ssl         = var.cloud_sql_require_ssl
#     private_network     = local.private_network
#     allocated_ip_range  = var.cloud_sql_allocated_ip_range
#     authorized_networks = var.cloud_sql_authorized_networks
#   }
# }
