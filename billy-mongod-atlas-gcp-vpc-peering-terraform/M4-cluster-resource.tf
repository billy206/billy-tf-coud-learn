# This cluster is in GCP cloud-provider with VPC peering enabled

resource "mongodbatlas_cluster" "cluster" {
  project_id   = var.mongodb_atlas_project_id
  name         = "cluster-test"
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "EASTERN_ASIA_PACIFIC"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  labels {
    key   = "environment"
    value = "prod"
  }
  cloud_backup                 = false
  auto_scaling_disk_gb_enabled = false
  # mongo_db_major_version                  = "5.0"
  auto_scaling_compute_enabled            = false
  auto_scaling_compute_scale_down_enabled = false

  ####################################
  # for ldpro
  # auto_scaling_compute_enabled            = true
  # auto_scaling_compute_scale_down_enabled = true

  # Provider Settings "block"
  # provider_name               = "GCP"
  provider_name               = "TENANT"
  provider_region_name        = "EASTERN_ASIA_PACIFIC"
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
