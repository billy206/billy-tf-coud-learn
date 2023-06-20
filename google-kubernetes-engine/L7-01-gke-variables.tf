# GKE Cluster Input Variables

variable "cluster_release_channel" {
  description = "release channel version for GKE cluster"
  type        = string
  default     = "REGULAR"
}

variable "cluster_kubernetes_version" {
  description = "kubernetes version for GKE cluster"
  type        = string
  default     = "latest"
}

variable "cluster_regional" {
  description = "regional for GKE cluster"
  type        = bool
  default     = false
}

variable "cluster_create_service_account" {
  description = "A service account is automatically created"
  type        = bool
  default     = false
}

variable "cluster_subnetwork_suffix" {
  description = "Suffix name of the GKE cluster"
  type        = string
  default     = "alpha-subnet"
}

variable "cluster_enable_private_endpoint" {
  description = "GKE private endpoint"
  type        = bool
  default     = true
}

variable "cluster_enable_private_nodes" {
  description = "GKE private nodes"
  type        = bool
  default     = true
}

variable "cluster_master_ipv4_cidr_block" {
  description = "master ipv4 cidr of the kubernetes control plane"
  type        = string
  default     = "10.0.0.0/28"
}

variable "cluster_master_global_access_enabled" {
  description = "master global access of the kubernetes control plane"
  type        = bool
  default     = true
}

variable "cluster_master_authorized_networks" {
  description = "master control plane authorized network"
  type        = list(object({ cidr_block = string, display_name = string }))
  default     = []
}

variable "cluster_default_max_pods_per_node" {
  description = "default max pods number per worknode"
  type        = number
  default     = 110
}

variable "cluster_datapath_provider" {
  description = "kubernetes network policy Dataplane V2"
  type        = string
  default     = "DATAPATH_PROVIDER_UNSPECIFIED"
}

variable "cluster_network_policy" {
  description = "Network policy manager for Kubernetes pods traffic"
  type        = bool
  default     = false
}

variable "cluster_identity_namespace" {
  description = "The identity namespace for attaching all Kubernetes service accounts"
  type        = string
  default     = "enabled"
}

variable "cluster_http_load_balancing" {
  description = "The HTTP Load Balancer for Kubernetes Ingress and Google Cloud Load Balancer"
  type        = bool
  default     = false
}

variable "cluster_horizontal_pod_autoscaling" {
  description = "Kubernetes Horizontal Pods Autoscaler"
  type        = bool
  default     = false
}

variable "cluster_gce_pd_csi_driver" {
  description = "Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver for Kubernetes pod use"
  type        = bool
  default     = false
}

variable "cluster_filestore_csi_driver" {
  description = "Google Filestore service Container Storage Interface (CSI) Driver for Kubernetes pod use"
  type        = bool
  default     = false
}

variable "cluster_remove_default_node_pool" {
  description = "Remove default node pool"
  type        = bool
  default     = false
}
