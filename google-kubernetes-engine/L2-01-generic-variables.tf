# Input Variables
# Project ID
variable "project_id" {
  description = "The ID for GCP Project"
  type        = string
  default     = "alpha-id"
}

# GCP Region
variable "gcp_region" {
  description = "Region in which GKE Resources to be created"
  type        = string
  default     = "asia-east1"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable as a suffix"
  type        = string
  default     = "alpha-dev"
}

# Product Name
variable "product_name" {
  description = "Product Name"
  type        = string
  default     = "alpha-product"
}
