# Web VM

resource "google_compute_instance" "web_vm" {
  name                      = "${var.vpc_name}-web-vm"
  zone                      = var.gcp_zone
  machine_type              = var.vm_machine_type["web"]
  tags                      = var.web_vm_tags
  allow_stopping_for_update = true
  metadata_startup_script   = file("${path.module}/webserver.sh")

  labels = {
    environment = "prod"
    app-name    = "${var.vpc_name}-web-vm"
    vm-role     = "prod-app"
  }

  network_interface {
    network     = var.network_id
    stack_type = "IPV4_ONLY"
    subnetwork = var.subnet1_name

    access_config {
      network_tier = "PREMIUM"
      #network_tier = "STANDARD" 
    }
  }

  boot_disk {
    auto_delete = true
    device_name = "${var.vpc_name}-web-app"
    mode        = "READ_WRITE"
    initialize_params {
      image = var.vm_image_ubuntu
      size  = var.vm_boot_disk_size
      type  = var.vm_boot_disk_type
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
    ssh-keys       = "my-user:ssh-rsa B768FG4NzaC1yc2EAAAADAQABAAAHGDGDGDLSJCAQClF1H1iCAo6zwBdV6hdhdhdhdDBHGR== my-user"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD" #"SPOT"
  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email = "cloudvm-sa@${var.project_id}.iam.gserviceaccount.com"
    #scopes = ["cloud-platform"]
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }

}

# DB VM

resource "google_compute_instance" "db_vm" {
  name                      = "${var.vpc_name}-db-vm"
  zone                      = var.gcp_zone_europe_west2
  machine_type              = var.vm_machine_type["db"]
  tags                      = var.db_vm_tags
  allow_stopping_for_update = true

  labels = {
    environment = "prod"
    app-name    = "${var.vpc_name}-db-vm"
    vm-role     = "prod-db"
  }

  network_interface {
    network     = var.network_id
    #subnetwork = google_compute_subnetwork.subnet[0].id
    subnetwork = var.subnet2_name
    stack_type = "IPV4_ONLY"

    # access_config { network_tier = "STANDARD" }  #network_tier = "PREMIUM"
  }

  boot_disk {
    auto_delete = true
    device_name = "${var.vpc_name}-db-vm"
    mode        = "READ_WRITE"
    initialize_params {
      image = var.vm_image_centos
      size  = var.vm_boot_disk_size
      type  = var.vm_boot_disk_type
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
    ssh-keys       = "aslam-user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClF1H1iCAo6zwBdVU97OYUQOlMADKpxZtalmV5tBGxaisQDPf7hL3emA1FodtKs7EdEn0Kp0wf8gSvlwUFnIJihNEprgc1tBG23p55qWl68LdZHxjaXZueLw1EnmbgIPp4LroiSd1nzwadDhKUq0+DEtq+HQKNH+fLaTbW8M1QNYT64GA/0KIWLj3z930pZpLHSA8fv4c8tB4VUUg9o2xOSQtpNiJ2q7lc27c9sdC8bnPvkFd1ia6CzClOWRVm1AED1gtQIpikHeTc8HhNJDXTI/nfJwpM3zp14YxCH4ykRwYDhOA963i1i5V55meLZS4zS3dHOS/7OOCiwJJ7PaF8RwM/fGSIS5sg8HNfLj0F5TLIqDqbd8Dn1kBcn3NYOCbpWpp5Sgj1UJg2pR11brtCjK4kKyBaX6H0l5dXTWcydMXARXZMb+TztHdYeokslVTgOR/pFOUBpSrXtL7PrhIGVCrSORsJ7lJfpPJ2m6m/dvLuyUaVRlDLSN4B6Oy0TuciXW01+X4zELgfhsqnq/7n+/kwiImXgNyeMu98gPdo6PQ0Lg648kKwP5eNsRD0MQkryv88eNki6K0OcWS7BM5lWUbM370QF6HeO7y6bHcaDwrnpb2dN3q74AOFkEG9aZZCyYu5peFBCXWfA8q/jmOoKbdfE7IxQA1mYcrKicxedw== aslam-user"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD" #"SPOT"
  }




  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "cloudvm-sa@${var.project_id}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }

}

# App VM

data "google_compute_zones" "gcp_azones" {
  region = var.gcp_region_europe_west2
}

resource "google_compute_instance" "app_vm" {
  #count                     = 2
  name                      = "${var.vpc_name}-app-vm-${each.value}"
  #name                      = "${var.vpc_name}-${var.app_name[count.index]}"
  zone                      = each.key # You can also use each.value because for list items each.key == each.value
  #zone                      = var.gcp_zone_europe_west2
  for_each                  = toset(data.google_compute_zones.gcp_azones.names)
  machine_type              = var.vm_machine_type["app"]
  tags                      = var.db_vm_tags
  allow_stopping_for_update = true
  metadata_startup_script   = file("${path.module}/app.sh")

  labels = {
    environment = "prod-app-vm"
    app-name    = "${var.vpc_name}-${each.value}"
    vm-role     = "prod-app-vm"
  }

  network_interface {
    network     = var.network_id
    #network = google_compute_network.vpc.id
    subnetwork = var.subnet3_name
    #subnetwork = google_compute_subnetwork.subnet[0].id
    stack_type = "IPV4_ONLY"

    # access_config { network_tier = "STANDARD" }  #network_tier = "PREMIUM"
  }

  boot_disk {
    auto_delete = true
    device_name = "${var.vpc_name}-${each.value}"
    mode        = "READ_WRITE"
    initialize_params {
      image = var.vm_image_ubuntu
      size  = var.vm_boot_disk_size
      type  = var.vm_boot_disk_type
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
    ssh-keys       = "aslam-user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClF1H1iCAo6zwBdVU97OYUQOlMADKpxZtalmV5tBGxaisQDPf7hL3emA1FodtKs7EdEn0Kp0wf8gSvlwUFnIJihNEprgc1tBG23p55qWl68LdZHxjaXZueLw1EnmbgIPp4LroiSd1nzwadDhKUq0+DEtq+HQKNH+fLaTbW8M1QNYT64GA/0KIWLj3z930pZpLHSA8fv4c8tB4VUUg9o2xOSQtpNiJ2q7lc27c9sdC8bnPvkFd1ia6CzClOWRVm1AED1gtQIpikHeTc8HhNJDXTI/nfJwpM3zp14YxCH4ykRwYDhOA963i1i5V55meLZS4zS3dHOS/7OOCiwJJ7PaF8RwM/fGSIS5sg8HNfLj0F5TLIqDqbd8Dn1kBcn3NYOCbpWpp5Sgj1UJg2pR11brtCjK4kKyBaX6H0l5dXTWcydMXARXZMb+TztHdYeokslVTgOR/pFOUBpSrXtL7PrhIGVCrSORsJ7lJfpPJ2m6m/dvLuyUaVRlDLSN4B6Oy0TuciXW01+X4zELgfhsqnq/7n+/kwiImXgNyeMu98gPdo6PQ0Lg648kKwP5eNsRD0MQkryv88eNki6K0OcWS7BM5lWUbM370QF6HeO7y6bHcaDwrnpb2dN3q74AOFkEG9aZZCyYu5peFBCXWfA8q/jmOoKbdfE7IxQA1mYcrKicxedw== aslam-user"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD" #"SPOT"
  }

  lifecycle {
    ignore_changes = all
  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "cloudvm-sa@${var.project_id}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]

  }

}