#VPC Outputs

output "network" {
  value       = google_compute_network.vpc
  description = "The VPC resource being created"
}

output "network_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value = google_compute_network.vpc.id
}

output "network_self_link" {
  value       = google_compute_network.vpc.self_link
  description = "The URI of the VPC being created"
}

output "network_project_id" {
  value       = google_compute_network.vpc.project
  description = "VPC project id"
}



#First Subnet Output

output "subnet1_name" {
  value       = google_compute_subnetwork.subnet1.name
  description = "The name of the subnetwork"
}

output "subnet1_cidr" {
  value       = google_compute_subnetwork.subnet1.ip_cidr_range
  description = "Primary CIDR range"
}

output "subnet1_self_link" {
  value       = google_compute_subnetwork.subnet1.self_link
  description = "The URI of the created resource"
}

#Second Subnet Output

output "subnet2_name" {
  value       = google_compute_subnetwork.subnet[0].name
  description = "The name of the subnetwork"
}

output "subnet2_cidr" {
  value       = google_compute_subnetwork.subnet[0].ip_cidr_range
  description = "Primary CIDR range"
}

output "subnet2_self_link" {
  value       = google_compute_subnetwork.subnet[0].self_link
  description = "The URI of the created resource"
}

#Third Subnet Output

output "subnet3_name" {
  value       = google_compute_subnetwork.subnet[1].name
  description = "The name of the subnetwork"
}

output "subnet3_cidr" {
  value       = google_compute_subnetwork.subnet[1].ip_cidr_range
  description = "Primary CIDR range"
}

output "subnet3_self_link" {
  value       = google_compute_subnetwork.subnet[1].self_link
  description = "The URI of the created resource"
}

#Fourth Subnet Output

output "subnet4_name" {
  value       = google_compute_subnetwork.subnet[2].name
  description = "The name of the subnetwork"
}

output "subnet4_cidr" {
  value       = google_compute_subnetwork.subnet[2].ip_cidr_range
  description = "Primary CIDR range"
}

output "subnet4_self_link" {
  value       = google_compute_subnetwork.subnet[2].self_link
  description = "The URI of the created resource"
}

output "pod_cidr_name" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[0].range_name
  description = "Name of the secondary CIDR range"
}

output "pod_cidr" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[0].ip_cidr_range
  description = "Secondary CIDR range"
}

output "service_cidr_name" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[1].range_name
  description = "Name of the secondary CIDR range"
}

output "service_cidr" {
  value       = google_compute_subnetwork.subnet1.secondary_ip_range[1].ip_cidr_range
  description = "Secondary CIDR range"
}
