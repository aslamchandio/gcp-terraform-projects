# A service project gains access to network resources provided by its
# associated host project.

# A host project provides network resources to associated service projects.
resource "google_compute_shared_vpc_host_project" "host_project" {
  project = var.host_project_id
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service_project" {
  host_project    = google_compute_shared_vpc_host_project.host_project.project
  service_project = var.service_project_id
}


resource "google_compute_subnetwork_iam_member" "member_1" {
  project    = var.host_project_id
  region     = var.gcp_region_1
  subnetwork = google_compute_subnetwork.subnet1.id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:425540237061@cloudservices.gserviceaccount.com"

}

resource "google_compute_subnetwork_iam_member" "member_2" {
  project    = var.host_project_id
  region     = var.gcp_region_2
  subnetwork = google_compute_subnetwork.subnet2.id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:425540237061@cloudservices.gserviceaccount.com"
}

resource "google_compute_subnetwork_iam_member" "member_3" {
  project    = var.host_project_id
  region     = var.gcp_region_1
  subnetwork = google_compute_subnetwork.regional_proxy_subnet.id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:425540237061@cloudservices.gserviceaccount.com"
}

resource "google_compute_subnetwork_iam_member" "member_4" {
  project    = var.host_project_id
  region     = var.gcp_region_1
  subnetwork = google_compute_subnetwork.subnet1.id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:service-425540237061@compute-system.iam.gserviceaccount.com"

}


resource "google_compute_subnetwork_iam_member" "member_5" {
  project    = var.host_project_id
  region     = var.gcp_region_2
  subnetwork = google_compute_subnetwork.subnet2.id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:service-425540237061@compute-system.iam.gserviceaccount.com"
}

resource "google_compute_subnetwork_iam_member" "member_6" {
  project    = var.host_project_id
  region     = var.gcp_region_1
  subnetwork = google_compute_subnetwork.subnet1.id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:service-425540237061@container-engine-robot.iam.gserviceaccount.com"
}

/*

# Give Gke SA service-425540237061@container-engine-robot.iam.gserviceaccount.com    on Host Project
# Kubernetes Engine Host Service Agent User  roles/container.hostServiceAgentUser
# Compute Security Admin  roles/compute.securityAdmin 
# Kubernetes Engine Host Service Agent User Role 


On Host Project

gcloud projects add-iam-policy-binding terraform-project-667889 \
    --member=serviceAccount:serviceAccount:service-425540237061@container-engine-robot.iam.gserviceaccount.com \
    --role=roles/container.hostServiceAgentUser

gcloud projects add-iam-policy-binding terraform-project-667889 \
    --member=serviceAccount:serviceAccount:service-425540237061@container-engine-robot.iam.gserviceaccount.com \
    --role=roles/compute.securityAdmin

*/    

