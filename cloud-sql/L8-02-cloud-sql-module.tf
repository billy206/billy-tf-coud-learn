# Replica IP Configuration
locals {
  name = data.terraform_remote_state.workspace.outputs.local_name

  project_id = data.terraform_remote_state.workspace.outputs.generic_project_id
  region     = data.terraform_remote_state.workspace.outputs.generic_gcp_region

  product_name = data.terraform_remote_state.workspace.outputs.generic_product_name
  environment  = data.terraform_remote_state.workspace.outputs.generic_environment

  private_network = data.terraform_remote_state.workspace.outputs.network_id

  read_replica_ip_configuration = {
    ipv4_enabled        = var.cloud_sql_ipv4_enabled
    require_ssl         = var.cloud_sql_require_ssl
    private_network     = local.private_network
    allocated_ip_range  = var.cloud_sql_allocated_ip_range
    authorized_networks = var.cloud_sql_authorized_networks
  }
}

data "terraform_remote_state" "workspace" {
  backend = "remote"

  config = {
    organization = "billy-test-tf"
    workspaces = {
      name = "gke-billy-tf-coud-learn"
    }
  }
}

# GCP Availability Zones Datasource
# data "google_compute_zones" "available" {
#   project = local.project_id
#   region  = local.region
# }

# resource "random_integer" "index" {
#   min = 0
#   max = length(data.google_compute_zones.available.names) - 1
# }

#########################################################
# Create Cloud SQL (PostgreSQL) Platform Terraform Module
#########################################################
module "cloud-sql-db-postgresql-plt" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "15.0.0"

  # Cloud SQL Project Configuration
  project_id = local.project_id
  region     = local.region

  # Cloud SQL Master Configuration
  name                        = "${local.name}-plt"
  database_version            = var.cloud_sql_database_version
  tier                        = var.cloud_sql_tier
  zone                        = var.cloud_sql_zone
  availability_type           = var.cloud_sql_availability_type
  deletion_protection         = var.cloud_sql_deletion_protection
  deletion_protection_enabled = var.cloud_sql_deletion_protection_enabled

  disk_autoresize       = var.cloud_sql_disk_autoresize
  disk_autoresize_limit = var.cloud_sql_disk_autoresize_limit
  disk_size             = var.cloud_sql_disk_size
  disk_type             = var.cloud_sql_disk_type

  user_labels = {
    database-type = "master"
    product_name  = local.product_name
    environment   = local.environment
  }

  ip_configuration = {
    ipv4_enabled        = var.cloud_sql_ipv4_enabled
    require_ssl         = var.cloud_sql_require_ssl
    private_network     = local.private_network
    allocated_ip_range  = var.cloud_sql_allocated_ip_range
    authorized_networks = var.cloud_sql_authorized_networks
  }

  backup_configuration = var.cloud_sql_backup_configuration

  # Cloud SQL Read Replica Configuration
  read_replica_name_suffix = var.cloud_sql_replica_name_suffix
  read_replicas = [
    {
      name = "-0"
      # zone                  = data.google_compute_zones.available.names[random_integer.index.result]
      zone                  = "${local.region}-c"
      availability_type     = var.cloud_sql_availability_type
      tier                  = var.cloud_sql_tier
      ip_configuration      = local.read_replica_ip_configuration
      database_flags        = []
      disk_autoresize       = var.cloud_sql_disk_autoresize
      disk_autoresize_limit = var.cloud_sql_disk_autoresize_limit
      disk_size             = var.cloud_sql_disk_size
      disk_type             = var.cloud_sql_disk_type
      user_labels = {
        database-type = "read-replica"
        product_name  = local.product_name
        environment   = local.environment
      }
      encryption_key_name = null
    }
  ]
  read_replica_deletion_protection         = var.cloud_sql_replica_deletion_protection
  read_replica_deletion_protection_enabled = var.cloud_sql_replica_deletion_protection_enabled

  db_name      = var.cloud_sql_db_name
  db_charset   = var.cloud_sql_db_charset
  db_collation = var.cloud_sql_db_collation

  additional_databases = []

  user_name     = var.cloud_sql_user_name
  user_password = var.cloud_sql_user_password

  additional_users = var.cloud_sql_additional_users

  create_timeout = var.cloud_sql_create_timeout
  update_timeout = var.cloud_sql_update_timeout
  delete_timeout = var.cloud_sql_delete_timeout
}

#########################################################
# Create Cloud SQL (PostgreSQL) ClientSide Terraform Module
#########################################################
module "cloud-sql-db-postgresql-cs" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "15.0.0"

  # Cloud SQL Project Configuration
  project_id = local.project_id
  region     = local.region

  # Cloud SQL Master Configuration
  name                        = "${local.name}-cs"
  database_version            = var.cloud_sql_database_version
  tier                        = var.cloud_sql_tier
  zone                        = var.cloud_sql_zone
  availability_type           = var.cloud_sql_availability_type
  deletion_protection         = var.cloud_sql_deletion_protection
  deletion_protection_enabled = var.cloud_sql_deletion_protection_enabled

  disk_autoresize       = var.cloud_sql_disk_autoresize
  disk_autoresize_limit = var.cloud_sql_disk_autoresize_limit
  disk_size             = var.cloud_sql_disk_size
  disk_type             = var.cloud_sql_disk_type

  user_labels = {
    database-type = "master"
    product_name  = local.product_name
    environment   = local.environment
  }

  ip_configuration = {
    ipv4_enabled        = var.cloud_sql_ipv4_enabled
    require_ssl         = var.cloud_sql_require_ssl
    private_network     = local.private_network
    allocated_ip_range  = var.cloud_sql_allocated_ip_range
    authorized_networks = var.cloud_sql_authorized_networks
  }

  backup_configuration = var.cloud_sql_backup_configuration

  # Cloud SQL Read Replica Configuration
  read_replica_name_suffix = var.cloud_sql_replica_name_suffix
  read_replicas = [
    {
      name                  = "-0"
      zone                  = "${local.region}-c"
      availability_type     = var.cloud_sql_availability_type
      tier                  = var.cloud_sql_tier
      ip_configuration      = local.read_replica_ip_configuration
      database_flags        = []
      disk_autoresize       = var.cloud_sql_disk_autoresize
      disk_autoresize_limit = var.cloud_sql_disk_autoresize_limit
      disk_size             = var.cloud_sql_disk_size
      disk_type             = var.cloud_sql_disk_type
      user_labels = {
        database-type = "read-replica"
        product_name  = local.product_name
        environment   = local.environment
      }
      encryption_key_name = null
    }
  ]
  read_replica_deletion_protection         = var.cloud_sql_replica_deletion_protection
  read_replica_deletion_protection_enabled = var.cloud_sql_replica_deletion_protection_enabled

  db_name      = var.cloud_sql_db_name
  db_charset   = var.cloud_sql_db_charset
  db_collation = var.cloud_sql_db_collation

  additional_databases = []

  user_name     = var.cloud_sql_user_name
  user_password = var.cloud_sql_user_password

  additional_users = var.cloud_sql_additional_users

  create_timeout = var.cloud_sql_create_timeout
  update_timeout = var.cloud_sql_update_timeout
  delete_timeout = var.cloud_sql_delete_timeout
}
