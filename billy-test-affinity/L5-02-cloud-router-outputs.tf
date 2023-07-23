# Cloud Router Output Values

# Cloud Router ID
output "cloud_router_id" {
  description = "The ID of the Cloud Router"
  value       = module.cloud-router.router.id
}

# Cloud Router Name
output "cloud_router_name" {
  description = "The Name of the Cloud Router"
  value       = module.cloud-router.router.name
}
