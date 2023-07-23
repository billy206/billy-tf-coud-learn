# VPC Output Values

# VPC Network ID
output "network_id" {
  description = "The ID of the VPC"
  value       = module.vpc.network_id
}

# VPC Network Name
output "network_name" {
  description = "The Network Name of the VPC"
  value       = module.vpc.network_name
}

# VPC Subnets Name
output "subnets_names" {
  description = "The Subnet Name of the VPC"
  value       = module.vpc.subnets_names[0]
}

# VPC Subnets Region
output "subnets_regions" {
  description = "The Subnet Region of the VPC"
  value       = module.vpc.subnets_regions[0]
}

# VPC Subnets Secondary ranges
output "subnets_secondary_ranges" {
  description = "List of secondary ranges of subnets"
  value       = { for i in module.vpc.subnets_secondary_ranges.* [0] : i.range_name => i.ip_cidr_range }
}

# VPC Subnets IDs
output "subnets_ids" {
  description = "List of IDs of subnets"
  value       = module.vpc.subnets_ids[0]
}

# VPC Subnets IPs
output "subnets_ips" {
  description = "List of IPs of subnets"
  value       = module.vpc.subnets_ips[0]
}
