# Cloud NAT Output Values

# Cloud NAT Name
output "cloud_nat_name" {
  description = "The Name of the Cloud NAT"
  value       = module.cloud-nat.name
}

# Cloud NAT IP Allocate
output "cloud_nat_ip_allocate_option" {
  description = "The IP Allocate of the Cloud NAT"
  value       = module.cloud-nat.nat_ip_allocate_option
}

# Cloud NAT Router Name
output "cloud_nat_router_name" {
  description = "The Router Name of the Cloud NAT"
  value       = module.cloud-nat.router_name
}
