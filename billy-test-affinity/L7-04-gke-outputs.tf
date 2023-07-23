# GKE Cluster Outputs Values
output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.gke.name
}

output "cluster_id" {
  description = "The id of the GKE cluster"
  value       = module.gke.cluster_id
}

output "cluster_location" {
  description = "The location for GKE Kubernetes Cluster"
  value       = module.gke.location
}

output "cluster_region" {
  description = "Region of the GKE cluster"
  value       = module.gke.region
}

output "cluster_release_channel" {
  description = "Release channel of the GKE cluster"
  value       = module.gke.release_channel
}

output "cluster_master_version" {
  description = "Master node version of the GKE cluster"
  value       = module.gke.master_version
}

output "cluster_master_authorized_networks_config" {
  description = "Authorized network whitelist of the GKE cluster"
  value       = {for i in module.gke.master_authorized_networks_config.*.cidr_blocks[0] : i.display_name => i.cidr_block} 
}

output "cluster_identity_namespace" {
  description = "The identity_namespace for GKE Kubernetes Workload Identity"
  value       = module.gke.identity_namespace
}

output "cluster_node_pools_versions" {
  description = "Node pools version of the GKE cluster"
  value       = module.gke.node_pools_versions
}
