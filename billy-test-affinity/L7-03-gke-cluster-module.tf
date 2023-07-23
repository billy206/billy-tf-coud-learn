# Create GKE Terraform Module
module "gke" {
  depends_on = [module.vpc]

  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "26.1.1"

  # GKE Project Configuration
  project_id = var.project_id
  name       = local.name
  region     = var.gcp_region

  # GKE Basic Configuration
  release_channel        = var.cluster_release_channel
  kubernetes_version     = var.cluster_kubernetes_version
  regional               = var.cluster_regional
  create_service_account = var.cluster_create_service_account

  # GKE VPC Configuration
  network           = module.vpc.network_name
  subnetwork        = "${local.name}-${var.cluster_subnetwork_suffix}"
  ip_range_pods     = join("", values(module.vpc.subnets)[*].secondary_ip_range[0].range_name)
  ip_range_services = join("", values(module.vpc.subnets)[*].secondary_ip_range[1].range_name)

  # GKE Master Control Plane Network Configuration
  enable_private_endpoint      = var.cluster_enable_private_endpoint
  enable_private_nodes         = var.cluster_enable_private_nodes
  master_ipv4_cidr_block       = var.cluster_master_ipv4_cidr_block
  master_global_access_enabled = var.cluster_master_global_access_enabled
  master_authorized_networks   = var.cluster_master_authorized_networks
  default_max_pods_per_node    = var.cluster_default_max_pods_per_node

  # GKE Features
  datapath_provider          = var.cluster_datapath_provider
  network_policy             = var.cluster_network_policy
  http_load_balancing        = var.cluster_http_load_balancing
  horizontal_pod_autoscaling = var.cluster_horizontal_pod_autoscaling

  # GKE Security
  identity_namespace = var.cluster_identity_namespace

  # GKE Container Storage Interface
  gce_pd_csi_driver    = var.cluster_gce_pd_csi_driver
  filestore_csi_driver = var.cluster_filestore_csi_driver

  # This Node Pool module is automatically created, if not require can remove
  remove_default_node_pool = var.cluster_remove_default_node_pool

  # GKE Node Pool Cluster Auto Scale
  cluster_autoscaling = var.cluster_node_autoscaling

  # GKE Node Pool Configurationig
  node_pools              = var.cluster_node_pools
  node_pools_oauth_scopes = var.cluster_node_pools_oauth_scopes
  node_pools_labels       = var.cluster_node_pools_labels
  node_pools_metadata     = var.cluster_node_pools_metadata
  node_pools_taints       = var.cluster_node_pools_taints
  node_pools_tags         = var.cluster_node_pools_tags

}
