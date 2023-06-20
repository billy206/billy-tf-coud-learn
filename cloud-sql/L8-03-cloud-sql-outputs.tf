#########################################################
# Cloud SQL Platform Output Values
#########################################################
# Cloud SQL Master Instance Name (PLT)
output "cloud_sql_plt_master_instance_name" {
  description = "The Name for the master instance"
  value       = module.cloud-sql-db-postgresql-plt.*.instance_name[0]
}

# Cloud SQL Instance IPv4 Address (PLT)
output "cloud_sql_plt_master_instance_ip_address" {
  description = "The IPv4 address for master instance"
  value       = { for i in module.cloud-sql-db-postgresql-plt.*.instance_ip_address[0] : i.type => i.ip_address }
}

# Cloud SQL Public IP Address (PLT)
output "cloud_sql_plt_external_ip_address" {
  description = "Cloud SQL External IP Address"
  value       = [for i in module.cloud-sql-db-postgresql-plt[*].public_ip_address : i if length(i) != 0]
}

# Cloud SQL Replica Instance Name (PLT)
output "cloud_sql_plt_read_replica_instance_names" {
  description = "The Instance Names for replica instances"
  value       = flatten(module.cloud-sql-db-postgresql-plt.*.read_replica_instance_names)
}

# replicas_instance_first_ip_addresses (PLT)
output "cloud_sql_plt_read_replica_ip_addresses" {
  description = "Cloud SQL Read Replica IP Address"
  value       = flatten(module.cloud-sql-db-postgresql-plt.*.replicas_instance_first_ip_addresses)
}

#########################################################
# Cloud SQL ClientSide Output Values
#########################################################
# Cloud SQL Master Instance Name (CS)
output "cloud_sql_cs_master_instance_name" {
  description = "The Name for the master instance"
  value       = module.cloud-sql-db-postgresql-cs.*.instance_name[0]
}

# Cloud SQL Instance IPv4 Address (CS)
output "cloud_sql_cs_master_instance_ip_address" {
  description = "The IPv4 address for master instance"
  value       = { for i in module.cloud-sql-db-postgresql-cs.*.instance_ip_address[0] : i.type => i.ip_address }
}

# Cloud SQL Public IP Address (CS)
output "cloud_sql_cs_external_ip_address" {
  description = "Cloud SQL External IP Address"
  value       = [for i in module.cloud-sql-db-postgresql-cs[*].public_ip_address : i if length(i) != 0]
}

# Cloud SQL Replica Instance Name (CS)
output "cloud_sql_cs_read_replica_instance_names" {
  description = "The Instance Names for replica instances"
  value       = flatten(module.cloud-sql-db-postgresql-cs.*.read_replica_instance_names)
}

# replicas_instance_first_ip_addresses (CS)
output "cloud_sql_cs_read_replica_ip_addresses" {
  description = "Cloud SQL Read Replica IP Address"
  value       = flatten(module.cloud-sql-db-postgresql-cs.*.replicas_instance_first_ip_addresses)
}