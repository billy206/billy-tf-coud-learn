# Cloud SQL (PostgreSQL) Input Variables

# Cloud SQL IPv4
variable "cloud_sql_ipv4_enabled" {
  description = "Enable IPv4 for Cloud SQL Private Subnets Communication"
  type        = bool
  default     = true
}

# Cloud SQL SSL
variable "cloud_sql_require_ssl" {
  description = "SSL of the Cloud SQL Security Communication"
  type        = bool
  default     = false
}

# Cloud SQL Allocated IP Range
variable "cloud_sql_allocated_ip_range" {
  description = "Cloud SQL Allocated IP Range"
  type        = string
  default     = null
}

# Cloud SQL Authorized Networks
variable "cloud_sql_authorized_networks" {
  description = "Cloud SQL Authorized Networks"
  type        = list(map(string))
  default     = []
}

# Cloud SQL Master Name
variable "cloud_sql_name_suffix" {
  description = "Suffix of the Cloud SQL Master Name"
  type        = string
  default     = "alpha-master"
}

# Cloud SQL Database Version
variable "cloud_sql_database_version" {
  description = "Cloud SQL Database Version"
  type        = string
  default     = "POSTGRES_13"
}

# Cloud SQL Tier
variable "cloud_sql_tier" {
  description = "Cloud SQL Tier"
  type        = string
  default     = "db-f1-micro"
}

# Cloud SQL Zone
variable "cloud_sql_zone" {
  description = "Cloud SQL Zone"
  type        = string
  default     = "asia-east1-c"
}

# Cloud SQL Availability Type
variable "cloud_sql_availability_type" {
  description = "Cloud SQL Availability Type (Zone or Region)"
  type        = string
  default     = "ZONAL"
}

# Cloud SQL Deletion Protection
variable "cloud_sql_deletion_protection" {
  description = "Enable Delete Protection for Cloud SQL Master Instances"
  type        = bool
  default     = false
}

# Cloud SQL Deletion Protection Enabled
variable "cloud_sql_deletion_protection_enabled" {
  description = "Cloud SQL Deletion Protection Enabled across all surfaces (API, gcloud, Cloud Console and Terraform)"
  type        = bool
  default     = false
}

# Cloud SQL Disk Auto Resize
variable "cloud_sql_disk_autoresize" {
  description = "Cloud SQL Disk Auto Resize"
  type        = bool
  default     = true
}

# Cloud SQL Disk Auto Resize
variable "cloud_sql_disk_autoresize_limit" {
  description = "Cloud SQL Disk Auto Resize Maximum"
  type        = number
  default     = 0
}

# Cloud SQL Disk Size
variable "cloud_sql_disk_size" {
  description = "Cloud SQL Disk Size"
  type        = number
  default     = 10
}

# Cloud SQL Disk Type
variable "cloud_sql_disk_type" {
  description = "Cloud SQL Disk Type"
  type        = string
  default     = "PD_SSD"
}

# Cloud SQL Backup Configuration
variable "cloud_sql_backup_configuration" {
  description = "Cloud SQL Backup Configuration"
  type = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    "enabled" : false,
    "location" : null,
    "point_in_time_recovery_enabled" : false,
    "retained_backups" : null,
    "retention_unit" : null,
    "start_time" : null,
    "transaction_log_retention_days" : null
  }
}

/******************************************
  Cloud SQL Replica Configuration
 *****************************************/
# Cloud SQL Replica Name Suffix
variable "cloud_sql_replica_name_suffix" {
  description = "Suffix of the Cloud SQL Replica Name"
  type        = string
  default     = "alpha-replica"
}

# Prevent Terraform Destroy Delete Replica SQL Instances
variable "cloud_sql_replica_deletion_protection" {
  description = "Used to block Terraform from deleting replica SQL Instances"
  type        = bool
  default     = false
}

# Enables protection of replica instance
variable "cloud_sql_replica_deletion_protection_enabled" {
  description = "Enables protection of replica instance all surfaces (API, gcloud, Cloud Console and Terraform)."
  type        = bool
  default     = false
}

/******************************************
  Cloud SQL Database Configuration
 *****************************************/
# Cloud SQL Database DB Name
variable "cloud_sql_db_name" {
  description = "The name of the default database to create"
  type        = string
  default     = "default"
}

# Cloud SQL Database DB Charset
variable "cloud_sql_db_charset" {
  description = "The charset for the default database"
  type        = string
  default     = ""
}

# Cloud SQL Database DB Collation
variable "cloud_sql_db_collation" {
  description = "The collation for the default database"
  type        = string
  default     = ""
}

# Cloud SQL Additional Databases
variable "cloud_sql_additional_databases" {
  description = "A list of databases to be created in Database"
  type        = list(object({ name = string, charset = string, collation = string }))
  default     = []
}

# Cloud SQL User Name
variable "cloud_sql_user_name" {
  description = "The name of the default user"
  type        = string
  default     = ""
}

# Cloud SQL User Password
variable "cloud_sql_user_password" {
  description = "The password for the default user"
  type        = string
  default     = ""
}

# Cloud SQL Additional Users
variable "cloud_sql_additional_users" {
  description = "A list of users to be created in Database"
  type        = list(object({ name = string, password = string, random_password = bool }))
  default = [
    {
      name            = "alpha-db-user1"
      password        = "alpha-db-password1"
      host            = "localhost"
      random_password = false
    }
  ]
}

# Cloud SQL Create Timeout
variable "cloud_sql_create_timeout" {
  description = "Cloud SQL Create Timeout"
  type        = string
  default     = "30m"
}

# Cloud SQL Update Timeout
variable "cloud_sql_update_timeout" {
  description = "Cloud SQL Update Timeout"
  type        = string
  default     = "30m"
}

# Cloud SQL Delete Timeout
variable "cloud_sql_delete_timeout" {
  description = "Cloud SQL Delete Timeout"
  type        = string
  default     = "30m"
}
