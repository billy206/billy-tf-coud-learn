# MongoDB Atlas Basic Configuration
mongodb_atlas_project_id           = "6493f8e283c08b7f55fbf42a"
mongodb_atlas_cluster_name_suffix  = "cluster"
mongodb_atlas_cluster_type         = "REPLICASET"
mongodb_atlas_region               = "asia-east1"
mongodb_atlas_provider_name        = "GCP"
mongodb_atlas_provider_region_name = "EASTERN_ASIA_PACIFIC"
mongodb_atlas_cidr                 = "192.168.0.0/16"

# MongoDB Atlas Replication Configuration
mongodb_atlas_replica_num_shards      = 1
mongodb_atlas_replica_region_name     = "EASTERN_ASIA_PACIFIC"
mongodb_atlas_replica_electable_nodes = 3
mongodb_atlas_replica_priority        = 7
mongodb_atlas_replica_read_only_nodes = 0

# MongoDB Atlas Other Configuration
mongodb_atlas_cloud_backup                            = false
mongodb_atlas_auto_scaling_disk_gb_enabled            = false
mongodb_atlas_auto_scaling_compute_enabled            = false
mongodb_atlas_auto_scaling_compute_scale_down_enabled = false
