# Generic Output Values

# Project ID
output "generic_project_id" {
  description = "The ID for GCP Project"
  value       = var.project_id
}

# GCP Region
output "generic_gcp_region" {
  description = "Region in which GKE Resources to be created"
  type        = string
  default     = "asia-east1"
}

# Environment Variable
output "generic_environment" {
  description = "Environment Variable as a suffix"
  type        = string
  default     = "alpha-dev"
}

# Product Name
output "generic_product_name" {
  description = "Product Name"
  type        = string
  default     = "alpha-product"
}

# Local Output Values

# local variable ('name')
output "local_name" {
  description = "locals name"
  type        = string
  default     = "alpha-product"
}
