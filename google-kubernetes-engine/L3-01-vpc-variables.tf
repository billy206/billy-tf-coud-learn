############################################
# VPC Input Variables
############################################
# VPC Name Suffix
variable "vpc_name_suffix" {
  description = "VPC Name Suffix"
  type        = string
  default     = "alpha-vpc"
}

# VPC MTU
variable "vpc_mtu" {
  description = "The MTU of the VPC"
  type        = number
  default     = 1460
}

# VPC Route Mode
variable "vpc_routing_mode" {
  description = "VPC Route Mode"
  type        = string
  default     = "GLOBAL"
}

############################################
# Subnet Input Variables
############################################
# Subnet Name Suffix
variable "network_subnet_name_suffix" {
  description = "Subnet Name Suffix"
  type        = string
  default     = "alpha-subnet"
}

# Subnet Secondary Range Pod Name Suffix

variable "network_secondary_range_pod_suffix" {
  description = "Secondary Range Pod Name Suffix"
  type        = string
  default     = "alpha-pods"
}

# Subnet Secondary Range Service Name Suffix
variable "network_secondary_range_service_suffix" {
  description = "Secondary Range Service Name Suffix"
  type        = string
  default     = "alpha-services"
}

# Subnet CIDR Block
variable "network_subnet_ip" {
  description = "Subnet CIDR Block"
  type        = string
  default     = "10.0.32.0/19"
}

# Subnet Secondary Range Pod CIDR Block
variable "network_subnet_secondary_range_pod_ip" {
  description = "Subnet Secondary Range Pod CIDR Block"
  type        = string
  default     = "10.0.128.0/18"
}

# Subnet Secondary Range Service CIDR Block
variable "network_subnet_secondary_range_service_ip" {
  description = "Subnet Secondary Range Service CIDR Block"
  type        = string
  default     = "10.0.64.0/20"
}
