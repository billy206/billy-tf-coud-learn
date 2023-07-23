# Cloud NAT Input Variables

# Cloud NAT Name Suffix
variable "cloud_nat_name_suffix" {
  description = "Cloud NAT Name Suffix"
  type        = string
  default     = "alpha-nat"
}

# Cloud NAT Minimum Port Per VM
variable "cloud_nat_min_ports_per_vm" {
  description = "Cloud NAT minimum number of ports per VM"
  type        = string
  default     = "64"
}

# Cloud NAT Source Subnet Range to NAT 
variable "cloud_nat_source_subnetwork_ip_ranges_to_nat" {
  description = "Cloud NAT Source Subnet Range to NAT"
  type        = string
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# Cloud NAT Log Config
variable "cloud_nat_log_config_enable" {
  description = "Cloud NAT Log Config"
  type        = bool
  default     = false
}

# Cloud NAT Log Filter
variable "cloud_nat_log_config_filter" {
  description = "Cloud NAT Log Filter"
  type        = string
  default     = "ALL"
}
