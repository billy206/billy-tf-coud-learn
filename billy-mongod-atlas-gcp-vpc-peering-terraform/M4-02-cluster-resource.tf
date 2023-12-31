# This cluster is in GCP cloud-provider with VPC peering enabled

#########################################################
# Create MongoDB Atlas Platform Terraform Resource
#########################################################
resource "mongodbatlas_cluster" "plt-cluster" {
  depends_on = [google_compute_network_peering.gcp-vpc-peering]

  # MongoDB Atlas Project ID
  project_id = var.mongodb_atlas_project_id

  name         = "${data.terraform_remote_state.workspace.outputs.local_name}-plt-${var.mongodb_atlas_cluster_name_suffix}"
  cluster_type = var.mongodb_atlas_cluster_type
  replication_specs {
    num_shards = var.mongodb_atlas_replica_num_shards

    regions_config {
      region_name     = var.mongodb_atlas_provider_region_name
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }

  labels {
    key   = "environment"
    value = "prod"
  }

  # TODO
  # termination_protection_enabled

  cloud_backup                            = var.mongodb_atlas_cloud_backup
  auto_scaling_disk_gb_enabled            = var.mongodb_atlas_auto_scaling_disk_gb_enabled
  mongo_db_major_version                  = "5.0"
  auto_scaling_compute_enabled            = var.mongodb_atlas_auto_scaling_compute_enabled
  auto_scaling_compute_scale_down_enabled = var.mongodb_atlas_auto_scaling_compute_scale_down_enabled

  ####################################
  # for ldpro
  # auto_scaling_compute_enabled            = true
  # auto_scaling_compute_scale_down_enabled = true

  # Provider Settings "block"
  # provider_name               = "GCP"
  provider_name               = "TENANT"
  provider_region_name        = var.mongodb_atlas_provider_region_name
  backing_provider_name       = "GCP"
  provider_instance_size_name = "M0"
  ####################################
  # for ldpro
  # provider_instance_size_name                     = "M10"
  # provider_auto_scaling_compute_max_instance_size = "M20"
  # provider_auto_scaling_compute_min_instance_size = "M10"

  # advanced_configuration {
  #   minimum_enabled_tls_protocol = "TLS1_2"
  # }

  # lifecycle {
  #   ignore_changes = [
  #     provider_instance_size_name
  #   ]
  # }
}
