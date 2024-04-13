resource "google_service_account" "cloudvm_sa" {
  account_id   = "cloudvm-sa"
  display_name = "Service Account for VMs"
}

resource "google_project_iam_member" "member_role" {
  for_each = toset([
    "roles/storage.admin",
    "roles/compute.admin",
    "roles/cloudsql.admin",
    "roles/iam.serviceAccountUser"
  ])
  role    = each.key
  project = var.project_id
  member  = "serviceAccount:${google_service_account.cloudvm_sa.email}"
}