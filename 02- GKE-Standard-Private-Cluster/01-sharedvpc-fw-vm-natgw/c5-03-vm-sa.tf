resource "google_service_account" "sa_accounts" {
  project      = var.service_project_id
  account_id   = "${local.name}-vm-sa"
  display_name = "Service Account VM"
}

resource "google_project_iam_member" "member-role" {
  for_each = toset([
    "roles/container.admin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator",
    "roles/artifactregistry.repoAdmin",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/storage.admin"

  ])
  role    = each.key
  project = var.service_project_id
  member  = "serviceAccount:${google_service_account.sa_accounts.email}"
}