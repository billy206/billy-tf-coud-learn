############################################
# Externel IP Address Input Variables
############################################

# NAT IP Address Name Suffix 
variable "nat_ip_name_suffix" {
  description = "NAT IP Address Name Suffix"
  type        = string
  default     = "alpha-nat-ip"
}

# NAT IP Address Type
variable "nat_ip_address_type" {
  description = "NAT IP Address Type"
  type        = string
  default     = "INTERNAL"
}

# NAT IP Address Network Tier
variable "nat_ip_address_network_tier" {
  description = "NAT IP Address Network Tier"
  type        = string
  default     = "PREMIUM"
}

# NAT IP Address Purpose
variable "nat_ip_address_purpose" {
  description = "NAT IP Address Purpose"
  type        = string
  default     = "GCE_ENDPOINT"
}

############################################
# Private Service Connection (PSC) Database IP Address CIDR Input Variables
############################################

# PSC Database IP Address Name Suffix
variable "psc_database_subnet_name_suffix" {
  description = "The suffix for the name of the PSC Database subnet"
  type        = string
  default     = "alpha-db-subnet"
}

# PSC Database IP Address Type
variable "psc_database_ip_address_type" {
  description = "The type of the PSC Database IP Address"
  type        = string
  default     = "INTERNAL"
}

# PSC Database IP Address Version
variable "psc_database_ip_address_version" {
  description = "The version of the PSC Database IP Address"
  type        = string
  default     = "IPV4"
}

# PSC Database IP Address Purpose
variable "psc_database_ip_address_purpose" {
  description = "PSC Database IP Address Purpose"
  type        = string
  default     = "GCE_ENDPOINT"
}

# PSC Database IP Address Prefix Length
variable "psc_database_ip_address_prefix_length" {
  description = "The prefix length of the PSC database IP range"
  type        = number
  default     = 24
}

# PSC Database Subnet CIDR
variable "psc_database_subnet_cidr" {
  description = "The CIDR of the PSC database subnet"
  type        = string
  default     = "10.0.210.0"
}
