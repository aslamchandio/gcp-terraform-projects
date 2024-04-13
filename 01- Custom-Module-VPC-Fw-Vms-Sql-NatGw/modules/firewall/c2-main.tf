resource "google_compute_firewall" "ssh_allow" {
  name        = "${var.vpc_name}-ssh-allow"
  network     = var.network_id
  description = "Creates firewall rule targeting SSH instances"

  direction     = "INGRESS"
  source_ranges = [var.source_ranges]
  target_tags   = ["ssh-allow"]
  priority      = 1000

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "rdp_allow" {
  name        = "${var.vpc_name}-rdp-allow"
  network     = var.network_id
  description = "Creates firewall rule targeting RDP instances"

  direction     = "INGRESS"
  source_ranges = [var.source_ranges]
  target_tags   = ["rdp-allow"]
  priority      = 1100

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}


resource "google_compute_firewall" "http_allow" {
  name        = "${var.vpc_name}-http-allow"
  network     = var.network_id
  description = "Creates firewall rule targeting HTTP instances"

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-allow"]
  priority      = 1200

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "9090"]
  }

}

resource "google_compute_firewall" "internal_allow" {
  name        = "${var.vpc_name}-internal-allow"
 network     = var.network_id
  description = "Creates firewall rule targeting Internal instances"

  direction = "INGRESS"
  #source_ranges = ["192.168.0.0/16"]
  source_ranges = [
    "${var.subnet1_cidr}",
    "${var.subnet2_cidr}",
    "${var.subnet3_cidr}",
    "${var.subnet4_cidr}"

  ]

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

}

resource "google_compute_firewall" "iap_allow" {
  name        = "${var.vpc_name}-iap-allow"
  network     = var.network_id
  description = "Creates firewall rule targeting IAP instances"

  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-allow"]
  priority      = 1400

  allow {
    protocol = "tcp"
    ports    = ["22", "3389", "3066", "1234"]
  }

}

resource "google_compute_firewall" "health_check_allow" {
  name        = "${var.vpc_name}-health-check-allow"
  network     = var.network_id
  description = "Creates firewall rule targeting Health Check instances"

  direction     = "INGRESS"
  source_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
  target_tags   = ["health-check-allow"]
  priority      = 1500

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

}



