# Resource: GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  project            = var.service_project_id
  name               = "${local.name}-private-cluster"
  location           = var.gcp_region_1
  network            = data.terraform_remote_state.project1_data.outputs.vpc_id
  subnetwork         = data.terraform_remote_state.project1_data.outputs.subnet1_id
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  networking_mode    = "VPC_NATIVE"

  initial_node_count       = 1
  remove_default_node_pool = var.remove_default_node_pool
  node_locations = [
    "${var.gcp_region_1}-b"
  ]


  deletion_protection       = var.deletion_protection
  default_max_pods_per_node = 110

  node_config {
    preemptible  = true
    machine_type = var.machine_type_map["test"]
    disk_type    = var.disk_type_map["test"]
    disk_size_gb = var.disk_size_map["test"]

  }
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.

  # Private Cluster Configurations
  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = var.enable_private_nodes
    master_ipv4_cidr_block  = var.master_ip_range
    master_global_access_config {
      enabled = true
    }
  }

  ip_allocation_policy {
    stack_type                    = "IPV4"
    cluster_secondary_range_name  = data.terraform_remote_state.project1_data.outputs.pod_cidr1_name
    services_secondary_range_name = data.terraform_remote_state.project1_data.outputs.service_cidr_name
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    # Enable GCS PDD CSI Driver 
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }

    # Enable GCS Fuse CSI Driver 
    gcs_fuse_csi_driver_config {
      enabled = true
    }

    # Enable GCS FileStore CSI Driver 
    gcp_filestore_csi_driver_config {
      enabled = true
    }

  }

  # Enable Vertical Pod Autoscaling
  vertical_pod_autoscaling {
    enabled = true
  }

  # Enable the Gateway API in your cluster
  gateway_api_config {
    channel = "CHANNEL_STANDARD"
  }


  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    #workload_pool = "terraform-project-667889.svc.id.goog"
    workload_pool = "${var.service_project_id}.svc.id.goog"
  }

  timeouts {
    create = "20m"
    update = "20m"
  }

  # In production, change it to true (Enable it to avoid accidental deletion)

  master_authorized_networks_config {
    cidr_blocks {
      display_name = "Home-IP"
      cidr_block   = var.source_ip_ranges
    }

    cidr_blocks {
      display_name = "CloudShell-IP"
      cidr_block   = var.cloudshell_source_ip_ranges
    }
    cidr_blocks {
      display_name = "SecondSubnet-CIDR"
      cidr_block   = data.terraform_remote_state.project1_data.outputs.subnet2_cidr
    }

  }

  /*

   lifecycle {
    ignore_changes = [node_pool]
  }

  */
}


/* 
Important Notes-1: It is recommended that node pools be created and 
managed as separate resources as in this. 
This allows node pools to be added and removed without recreating the cluster. 
Node pools defined directly in the google_container_cluster resource cannot be 
removed without re-creating the cluster.

Important Note-2: 
We can't create a cluster with no node pool defined, but we want to only use
separately managed node pools. So we create the smallest possible default
node pool and immediately delete it.

Important Note-3: 
Google recommends custom service accounts that have cloud-platform scope and 
permissions granted via IAM Roles.
*/
