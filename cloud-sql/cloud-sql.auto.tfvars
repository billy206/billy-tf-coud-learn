# Cloud SQL IP Configuration
cloud_sql_ipv4_enabled        = false
cloud_sql_require_ssl         = false
cloud_sql_allocated_ip_range  = null
cloud_sql_authorized_networks = []

# Cloud SQL Master Configuration
cloud_sql_name_suffix                 = ""
cloud_sql_database_version            = "POSTGRES_14"
cloud_sql_tier                        = "db-g1-small"
cloud_sql_zone                        = ""
cloud_sql_availability_type           = "REGIONAL"
cloud_sql_deletion_protection         = false
cloud_sql_deletion_protection_enabled = false
cloud_sql_disk_autoresize             = false
cloud_sql_disk_autoresize_limit       = 0
cloud_sql_disk_size                   = 10
cloud_sql_disk_type                   = "PD_SSD"
cloud_sql_backup_configuration = {
  enabled                        = false,
  location                       = null,
  point_in_time_recovery_enabled = false,
  retained_backups               = null,
  retention_unit                 = null,
  start_time                     = null,
  transaction_log_retention_days = null
}
c
# Cloud SQL Replica Configuration
cloud_sql_replica_name_suffix                 = ""
cloud_sql_replica_deletion_protection         = false
cloud_sql_replica_deletion_protection_enabled = false

# Cloud SQL Database Configuration
cloud_sql_db_name              = "default"
cloud_sql_db_charset           = ""
cloud_sql_db_collation         = ""
cloud_sql_additional_databases = []

# Cloud SQL User Configuration
cloud_sql_user_name        = "default"
cloud_sql_user_password    = ""
cloud_sql_additional_users = []

# Cloud SQL Module Timeout Configuration
cloud_sql_create_timeout = "60m"
cloud_sql_update_timeout = "60m"
cloud_sql_delete_timeout = "60m"
