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

# GCP Subnet CIDR
variable "gcp_cidr" {
  description = "The CIDR for GCP Project Network"
  type        = string
  default     = "10.0.0.0/16"
}

############################################
# Mongo Atlas Input Variables
############################################

# Mongo Atlas ID
variable "mongo_atlas_project_id" {
  description = "The ID for Atlas Project"
  type        = string
  default     = "mongo-atlas-id"
}

# Mongo Atlas Region
variable "mongo_atlas_region" {
  description = "The MongoDB Atlas region"
  type        = string
  default     = "asia-east1"
}
