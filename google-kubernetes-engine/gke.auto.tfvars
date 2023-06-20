cluster_release_channel              = "UNSPECIFIED"
cluster_kubernetes_version           = "1.25.8-gke.1000"
cluster_regional                     = true
cluster_create_service_account       = false
cluster_subnetwork_suffix            = "subnet"
cluster_enable_private_endpoint      = false
cluster_enable_private_nodes         = true
cluster_master_ipv4_cidr_block       = "10.8.0.0/28"
cluster_master_global_access_enabled = false
cluster_master_authorized_networks   = [{ cidr_block = "61.220.72.61/32", display_name = "alpha-1" }]
cluster_default_max_pods_per_node    = 64
cluster_datapath_provider            = "DATAPATH_PROVIDER_UNSPECIFIED"
cluster_network_policy               = false
cluster_identity_namespace           = "enabled"
cluster_http_load_balancing          = true
cluster_horizontal_pod_autoscaling   = true
cluster_gce_pd_csi_driver            = true
cluster_filestore_csi_driver         = false
cluster_remove_default_node_pool     = true

