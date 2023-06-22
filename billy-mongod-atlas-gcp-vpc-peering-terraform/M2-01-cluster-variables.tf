############################################
# MongoDB Atlas Input Variables
############################################

# MongoDB Atlas ID
variable "mongodb_atlas_project_id" {
  description = "The ID for MongoDB Atlas Project"
  type        = string
  default     = "mongodb-atlas-id"
}

# MongoDB Atlas Cluster Name
variable "mongodb_atlas_cluster_name_suffix" {
  description = "MongoDB Atlas Cluster Name Suffix"
  type        = string
  default     = "mongodb-atlas-cluster-name-suffix"
}

# MongoDB Atlas Cluster Name
variable "mongodb_atlas_cluster_type" {
  description = "MongoDB Atlas Cluster Type"
  type        = string
  default     = "REPLICASET"
}

# MongoDB Atlas Region
variable "mongodb_atlas_region" {
  description = "The MongoDB MongoDB Atlas region"
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
  default     = "192.168.0.0/16"
}

############################################
# MongoDB Atlas Replica Input Variables
############################################

# MongoDB Atlas Replica Num Shards
variable "mongodb_atlas_replica_num_shards" {
  description = "Deploy minimum 1 shard in specified zone"
  type        = number
  default     = 1
}

# MongoDB Atlas Replica Region Name
variable "mongodb_atlas_replica_region_name" {
  description = "MongoDB Atlas Replica Region Name"
  type        = string
  default     = "ASIA_EAST_2"
}

# MongoDB Atlas Replica Electable Nodes
variable "mongodb_atlas_replica_electable_nodes" {
  description = "MongoDB Atlas Replica Electable Nodes"
  type        = number
  default     = 3
}

# MongoDB Atlas Replica Priority
variable "mongodb_atlas_replica_priority" {
  description = "MongoDB Atlas Replica Priority"
  type        = number
  default     = 7
}

# MongoDB Atlas Replica Read Only Nodes
variable "mongodb_atlas_replica_read_only_nodes" {
  description = "MongoDB Atlas Replica Read Only Nodes"
  type        = number
  default     = 0
}

############################################
# MongoDB Atlas Other Input Variables
############################################

# MongoDB Atlas Cloud Backup
variable "mongodb_atlas_cloud_backup" {
  description = "MongoDB Atlas Cloud Backup"
  type        = bool
  default     = true
}

# MongoDB Atlas Auto Scale Disk GB
variable "mongodb_atlas_auto_scaling_disk_gb_enabled" {
  description = "MongoDB Atlas Cloud Backup"
  type        = bool
  default     = true
}

# MongoDB Atlas Auto Scale Compute
variable "mongodb_atlas_auto_scaling_compute_enabled" {
  description = "MongoDB Atlas Auto Scale Compute"
  type        = bool
  default     = true
}

# MongoDB Atlas Auto Scale Compute Scale Down
variable "mongodb_atlas_auto_scaling_compute_scale_down_enabled" {
  description = "MongoDB Atlas Auto Scale Compute Scale Down"
  type        = bool
  default     = true
}
