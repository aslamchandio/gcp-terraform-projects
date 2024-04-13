# Public IP Address for NatGW
resource "google_compute_address" "natgw_pip" {
  name         = "${var.vpc_name}-natgw-pip"
  region       = var.gcp_region_europe_west2
  address_type = "EXTERNAL"
}

resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-natgw-router"
  region  = var.gcp_region_europe_west2
  network     = var.network_id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "natgw" {
  name                               = "${var.vpc_name}-natgw"
  router                             = google_compute_router.router.name
  region                             = var.gcp_region_europe_west2
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.natgw_pip.self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.subnet2_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                    = var.subnet3_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

   subnetwork {
    name                    = var.subnet4_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  min_ports_per_vm = 512
  max_ports_per_vm = 1024

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}