resource "google_compute_instance" "gke_vm" {
  project                   = var.service_project_id
  name                      = "${local.name}-client"
  zone                      = var.gcp_zone_2
  machine_type              = var.vm_machine_type_map["dev"]
  metadata_startup_script   = file("${path.module}/web-script.sh")
  allow_stopping_for_update = true
  tags = [
    tolist(google_compute_firewall.fw_iap_allow.target_tags)[0]
  ]

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet2.self_link
    #access_config { network_tier = "STANDARD" }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
      size  = var.vm_disk_size
      type  = var.vm_disk_type

    }

  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.sa_accounts.email
    scopes = ["cloud-platform"]
  }

}