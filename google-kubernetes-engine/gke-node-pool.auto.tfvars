cluster_node_pools = [
  {
    version            = ""
    # name               = "default-node-pool"
    name               = "default-pool"
    machine_type       = "e2-standard-2"
    node_locations     = ""
    min_count          = 0
    max_count          = 5
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 50
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    enable_gcfs        = false
    enable_gvnic       = false
    auto_repair        = false
    auto_upgrade       = false
    service_account    = ""
    preemptible        = false
    initial_node_count = 0
  }
]

cluster_node_pools_oauth_scopes = {
  all = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
}

cluster_node_pools_labels = {
  all = {}

  default-node-pool = {
    default-node-pool = true
  }
}

cluster_node_pools_metadata = {
  all = {}

  default-node-pool = {
    node-pool-metadata-custom-value = "my-node-pool"
  }
}

cluster_node_pools_taints = {
  all = []

  default-node-pool = [
    {
      key    = "default-node-pool"
      value  = true
      effect = "PREFER_NO_SCHEDULE"
    },
  ]
}

cluster_node_pools_tags = {
  all = []

  default-node-pool = [
    "default-node-pool",
  ]
}
