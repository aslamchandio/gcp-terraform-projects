# Natgw for First Region
# Global Public IP Address for NatgGW
resource "google_compute_address" "natgw_pip1" {
  project = var.host_project_id
  name    = "${local.name}-${var.gcp_region_1}-natgw-pip"
  region  = var.gcp_region_1
}

resource "google_compute_router" "router1" {
  project = var.host_project_id
  name    = "${local.name}-${var.gcp_region_1}-natgw-router"
  region  = var.gcp_region_1
  network = google_compute_network.vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat1" {
  project                            = var.host_project_id
  name                               = "${local.name}-${var.gcp_region_1}-natgw"
  router                             = google_compute_router.router1.name
  region                             = var.gcp_region_1
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.natgw_pip1.self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnet1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  min_ports_per_vm = 512
  max_ports_per_vm = 1024

  log_config {
    enable = true
    filter = "ALL" #"ERRORS_ONLY"
  }
}

# Natgw for Second Region
# Global Public IP Address for NatgGW
resource "google_compute_address" "natgw_pip2" {
  project = var.host_project_id
  name    = "${local.name}-${var.gcp_region_2}-natgw-pip"
  region  = var.gcp_region_2
}

resource "google_compute_router" "router2" {
  project = var.host_project_id
  name    = "${local.name}-${var.gcp_region_2}-natgw-router"
  region  = var.gcp_region_2
  network = google_compute_network.vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat2" {
  project                            = var.host_project_id
  name                               = "${local.name}-${var.gcp_region_2}-natgw"
  router                             = google_compute_router.router2.name
  region                             = var.gcp_region_2
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.natgw_pip2.self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnet2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  min_ports_per_vm = 512
  max_ports_per_vm = 1024

  log_config {
    enable = true
    filter = "ALL" #"ERRORS_ONLY"
  }
}