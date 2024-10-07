# Resource: GKE Node Pool 1
resource "google_container_node_pool" "nodepool_1" {
  project  = var.service_project_id
  name     = "${local.name}-nodepool-01"
  location = var.gcp_region_1
  cluster  = google_container_cluster.gke_cluster.name

  node_count = 1
  node_locations = [
    "${var.gcp_region_1}-b",
    "${var.gcp_region_1}-f"
  ]

  max_pods_per_node = 110

  autoscaling {
    min_node_count  = 1
    max_node_count  = 3
    location_policy = "BALANCED"
  }


  management {
    auto_repair  = true
    auto_upgrade = true
  }

  timeouts {
    create = "20m"
    update = "20m"
  }


  node_config {
    preemptible  = false
    machine_type = var.machine_type_map["prod"]
    disk_type    = var.disk_type_map["dev"]
    disk_size_gb = var.disk_size_map["dev"]

    labels = {
      team = "devops"
    }

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    #tags = [tolist(data.terraform_remote_state.project1_data.outputs.name_iap)[0]]
  }
}
