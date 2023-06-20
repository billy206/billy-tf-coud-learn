# GKE Node Pool Input Variables
variable "cluster_node_pools" {
  description = "Node pools list of the GKE cluster"
  type        = list(map(any))
  default = [{
    version            = ""
    name               = "default-node-pool-alpha"
    machine_type       = "e2-medium"
    node_locations     = ""
    min_count          = 1
    max_count          = 5
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 50
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    enable_gcfs        = false
    enable_gvnic       = false
    auto_repair        = true
    auto_upgrade       = true
    service_account    = ""
    preemptible        = false
    initial_node_count = 3
  }]
}

variable "cluster_node_pools_oauth_scopes" {
  description = "Node pools oauth scopes of the GKE cluster"
  type        = map(list(string))
  default = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

variable "cluster_node_pools_labels" {
  description = "Node pools labels of the GKE cluster"
  type        = map(map(string))
  default = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }
}

variable "cluster_node_pools_metadata" {
  description = "Node pools metadata of the GKE cluster"
  type        = map(map(string))
  default = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }
}

variable "cluster_node_pools_taints" {
  description = "Node pools taints of the GKE cluster"
  type        = map(list(object({ key = string, value = string, effect = string })))
  default = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }
}

variable "cluster_node_pools_tags" {
  description = "Node pools tags of the GKE cluster"
  type        = map(list(string))
  default = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
