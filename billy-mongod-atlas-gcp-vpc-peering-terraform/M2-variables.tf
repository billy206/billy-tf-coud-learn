############################################
# Generic Input Variables
############################################

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
  default     = "alhpa-product"
}

############################################
# Google Cloud Platform Input Variables
############################################

# GCP Project ID
variable "gcp_project_id" {
  description = "The ID for GCP Project"
  type        = string
  default     = "alhpa-id"
}

# GCP Region
variable "gcp_region" {
  description = "The GCP Region"
  type        = string
  default     = "asia-east1"
}

############################################
# MongoDB Atlas Input Variables
############################################

# MongoDB Atlas ID
variable "mongodb_atlas_project_id" {
  description = "The ID for Atlas Project"
  type        = string
  default     = "mongo-atlas-id"
}

# MongoDB Atlas Region
variable "mongodb_atlas_region" {
  description = "The MongoDB Atlas region"
  type        = string
  default     = "asia-east1"
}

# MongoDB Atlas Provider Name
variable "mongodb_atlas_provider_name" {
  description = "The Name for MongoDB Atlas Provider"
  type        = string
  default     = "TENANT"
}

# MongoDB Atlas CIDR
variable "mongodb_atlas_cidr" {
  description = "The CIDR for MongoDB Atlas Network"
  type        = string
  default     = "172.0.0.0/18"
}

