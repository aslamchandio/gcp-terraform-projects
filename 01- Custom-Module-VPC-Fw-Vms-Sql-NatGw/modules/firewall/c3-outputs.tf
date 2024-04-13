# Firewall Outputs

# For SSH Allow
output "name_ssh" {
  value       = google_compute_firewall.ssh_allow.name
  description = "The name of the firewall rule being created"
}

output "network_name_ssh" {
  value       = google_compute_firewall.ssh_allow.network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_ssh" {
  value       = google_compute_firewall.ssh_allow.self_link
  description = "The URI of the firewall rule  being created"
}

#For RDP Allow
output "name_rdp" {
  value       = google_compute_firewall.rdp_allow.name
  description = "The name of the firewall rule being created"
}

output "network_name_rdp" {
  value       = google_compute_firewall.rdp_allow.network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_rdp" {
  value       = google_compute_firewall.rdp_allow.self_link
  description = "The URI of the firewall rule  being created"
}

# For HTTP Allow
output "name_http" {
  value       = google_compute_firewall.http_allow.name
  description = "The name of the firewall rule being created"
}

output "network_name_http" {
  value       = google_compute_firewall.http_allow.network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_http" {
  value       = google_compute_firewall.http_allow.self_link
  description = "The URI of the firewall rule  being created"
}


# For Internal Allow
output "name_internal" {
  value       = google_compute_firewall.internal_allow.name
  description = "The name of the firewall rule being created"
}

output "network_name_internal" {
  value       = google_compute_firewall.internal_allow.network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_internal" {
  value       = google_compute_firewall.internal_allow.self_link
  description = "The URI of the firewall rule  being created"
}

# For IAP Allow
output "name_iap" {
  value       = google_compute_firewall.iap_allow.name
  description = "The name of the firewall rule being created"
}

output "network_name_iap" {
  value       = google_compute_firewall.iap_allow.network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_iap" {
  value       = google_compute_firewall.iap_allow.self_link
  description = "The URI of the firewall rule  being created"
}

# For Health Check Allow
output "name_health_check" {
  value       = google_compute_firewall.health_check_allow.name
  description = "The name of the firewall rule being created"
}

output "network_name_health_check" {
  value       = google_compute_firewall.health_check_allow.network
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_health_check" {
  value       = google_compute_firewall.health_check_allow.self_link
  description = "The URI of the firewall rule  being created"
}
