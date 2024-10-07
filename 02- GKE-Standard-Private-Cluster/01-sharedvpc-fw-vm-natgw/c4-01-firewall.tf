
resource "google_compute_firewall" "fw_ssh_allow" {
  project     = var.host_project_id
  name        = "${local.name}-fw-ssh-allow"
  network     = google_compute_network.vpc.id
  description = "Creates firewall rule targeting SSH instances"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [var.source_ip_ranges]
  target_tags   = ["ssh-allow"]
  priority      = 1000
}



resource "google_compute_firewall" "fw_http_allow" {
  project     = var.host_project_id
  name        = "${local.name}-fw-http-allow"
  network     = google_compute_network.vpc.id
  description = "Creates firewall rule targeting HTTP instances"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "9090"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-allow"]
  priority      = 1200
}

resource "google_compute_firewall" "fw_internal_allow" {
  project     = var.host_project_id
  name        = "${local.name}-fw-internal-allow"
  network     = google_compute_network.vpc.id
  description = "Creates firewall rule targeting Internal instances"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]

  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  #source_ranges = ["192.168.0.0/16"]
  source_ranges = [
    "${google_compute_subnetwork.subnet1.ip_cidr_range}",
    "${google_compute_subnetwork.subnet2.ip_cidr_range}"

  ]

  priority = 1300
}

resource "google_compute_firewall" "fw_iap_allow" {
  project     = var.host_project_id
  name        = "${local.name}-fw-iap-allow"
  network     = google_compute_network.vpc.id
  description = "Creates firewall rule targeting IAP instances"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-allow"]
  priority      = 1400
}
