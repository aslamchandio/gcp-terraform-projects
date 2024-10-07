resource "google_service_account" "gke_sa" {
  project      = var.service_project_id
  account_id   = "${local.name}-gke-sa"
  display_name = "${local.name} GKE Service Account"
}