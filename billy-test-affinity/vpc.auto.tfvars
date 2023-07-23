# VPC Variables
vpc_mtu          = 1460
vpc_name_suffix  = "vpc"
vpc_routing_mode = "REGIONAL"

# Subnet Variables
network_subnet_name_suffix             = "subnet"
network_secondary_range_pod_suffix     = "pods"
network_secondary_range_service_suffix = "services"

network_subnet_ip                         = "172.8.32.0/19"
network_subnet_secondary_range_pod_ip     = "172.8.128.0/18"
network_subnet_secondary_range_service_ip = "172.8.64.0/20"
