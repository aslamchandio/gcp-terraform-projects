machine_type_map = {
  "test" = "e2-micro"
  "dev"  = "e2-small"
  "prod" = "e2-medium"
}

disk_type_map = {
  "test" = "pd-standard"
  "dev"  = "pd-balanced"
  "prod" = "pd-ssd"
}

disk_size_map = {
  "test" = 20
  "dev"  = 30
  "prod" = 50
}

enable_private_endpoint = false
enable_private_nodes    = true

deletion_protection      = false
remove_default_node_pool = true

cloudshell_source_ip_ranges = "34.126.116.20/32"
master_ip_range             = "172.16.1.0/28"
source_ip_ranges            = "12.55.11.45/32"

