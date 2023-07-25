cluster_node_autoscaling = {
  enabled             = false
  min_cpu_cores       = 0
  max_cpu_cores       = 0
  min_memory_gb       = 0
  max_memory_gb       = 0
  gpu_resources       = []
  auto_repair         = false
  auto_upgrade        = false
  autoscaling_profile = "OPTIMIZE_UTILIZATION"
}

cluster_node_pools = [
  {
    version            = ""
    name               = "default-pool"
    machine_type       = "e2-medium"
    node_locations     = ""
    min_count          = 1
    max_count          = 1
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
  },
  # {
  #   version            = ""
  #   name               = "java-app-pool"
  #   machine_type       = "e2-medium"
  #   node_locations     = ""
  #   min_count          = 1
  #   max_count          = 1
  #   local_ssd_count    = 0
  #   spot               = false
  #   disk_size_gb       = 50
  #   disk_type          = "pd-standard"
  #   image_type         = "COS_CONTAINERD"
  #   enable_gcfs        = false
  #   enable_gvnic       = false
  #   auto_repair        = false
  #   auto_upgrade       = false
  #   service_account    = ""
  #   preemptible        = false
  #   initial_node_count = 1
  # },
  {
    version            = ""
    name               = "redis-pool"
    machine_type       = "e2-medium"
    node_locations     = ""
    min_count          = 1
    max_count          = 3
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 50
    disk_type          = "pd-ssd"
    image_type         = "COS_CONTAINERD"
    enable_gcfs        = false
    enable_gvnic       = false
    auto_repair        = false
    auto_upgrade       = false
    service_account    = ""
    preemptible        = false
    initial_node_count = 1
  },
  # {
  #   version            = ""
  #   name               = "rabbitmq-pool"
  #   machine_type       = "e2-medium"
  #   node_locations     = ""
  #   min_count          = 1
  #   max_count          = 3
  #   local_ssd_count    = 0
  #   spot               = false
  #   disk_size_gb       = 50
  #   disk_type          = "pd-ssd"
  #   image_type         = "COS_CONTAINERD"
  #   enable_gcfs        = false
  #   enable_gvnic       = false
  #   auto_repair        = false
  #   auto_upgrade       = false
  #   service_account    = ""
  #   preemptible        = false
  #   initial_node_count = 1
  # }
]

cluster_node_pools_oauth_scopes = {
  all = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}

cluster_node_pools_labels = {
  all = {}

  default-node-pool = {
    default-node-pool = true
  }

  # java-app-pool = {
  #   node-purpose = "java-app-node"
  # }

  redis-pool = {
    node-purpose = "redis-node"
  }

  # rabbitmq-pool = {
  #   node-purpose = "rabbitmq-node"
  # }
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

  # java-app-pool = [
  #   {
  #     key    = "java-app-pool"
  #     value  = "java-app"
  #     effect = "NO_SCHEDULE"
  #   },
  # ]

  redis-pool = [
    {
      key    = "redis-pool"
      value  = "redis"
      effect = "NO_SCHEDULE"
    },
  ]

  # rabbitmq-pool = [
  #   {
  #     key    = "rabbitmq-pool"
  #     value  = "rabbitmq"
  #     effect = "NO_SCHEDULE"
  #   },
  # ]
}

cluster_node_pools_tags = {
  all = []

  default-node-pool = [
    "default-node-pool",
  ]

  # java-app-pool = [
  #   "java-app-pool",
  # ]

  redis-pool = [
    "redis-pool",
  ]
}
