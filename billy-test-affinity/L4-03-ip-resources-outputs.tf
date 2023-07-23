############################################
# NAT IP Address Output Values
############################################

# NAT IP Names and Addresses  
output "nat_ip_names_and_addresses" {
  description = "List of names and addresses"
  value       = { for i in google_compute_address.nat-ip-address : i.name => i.address }
}

############################################
# Database PSC IP Address Output Values
############################################

# Database PSC IP Name
output "db_psc_ip_address_name" {
  description = "Database PSC IP Name"
  value       = google_compute_global_address.psc-database-ip-range.name
}

# Database PSC IP Purpose
output "db_psc_ip_address_purpose" {
  description = "Database PSC IP Purpose"
  value       = google_compute_global_address.psc-database-ip-range.purpose
}

# Database PSC IP Range
output "db_psc_ip_Range" {
  description = "List of IP for Database PSC"
  value       = google_compute_global_address.psc-database-ip-range.address
}

# Database PSC IP Prefix Length
output "db_psc_ip_address_prefix_length" {
  description = "Database PSC IP Prefix Length"
  value       = google_compute_global_address.psc-database-ip-range.prefix_length
}

# Database PSC IP ID
output "db_psc_ip_addresses" {
  description = "List of ID of Database PSC IP"
  value       = google_compute_global_address.psc-database-ip-range.id
}
