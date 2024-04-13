# VPC Variables Values

vpc_name                = "prod-vpc"
auto_create_subnetworks = false
subnet_ip_ranges        = { "first_subnet" = "192.168.1.0/24" }
subnet_cidrs            = ["192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"]
subnets_name            = ["subnet1-euro-west2", "subnet2-euro-west2", "subnet3-euro-west2"]
  