resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = 1460
  routing_mode                    = "GLOBAL" #"REGIONAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "subnet1" {
  name                     = "${var.vpc_name}-subnet1-us-central1"
  region                   = var.gcp_region
  network                  = google_compute_network.vpc.id
  ip_cidr_range            = var.subnet_ip_ranges["first_subnet"]
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pod-cidr"
    ip_cidr_range = "10.244.0.0/16"
  }

  secondary_ip_range {
    range_name    = "service-cidr"
    ip_cidr_range = "10.34.0.0/16"
  }

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "subnet" {
  count                    = length(var.subnet_cidrs)
  name                     = "${var.vpc_name}-${var.subnets_name[count.index]}"
  region                   = var.gcp_region_europe_west2
  network                  = google_compute_network.vpc.id
  ip_cidr_range            = element(var.subnet_cidrs, count.index)
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_route" "internet_route" {
  name             = "${var.vpc_name}-egress-internet"
  description      = "route through IGW to access internet"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.id
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}