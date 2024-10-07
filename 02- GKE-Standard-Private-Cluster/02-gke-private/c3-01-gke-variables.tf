# GCP Compute Engine Machine Type
variable "machine_type_map" {
  description = "Compute Engine Machine Type"
  type        = map(string)
}

variable "disk_type_map" {
  description = "Compute Engine Machine Type"
  type        = map(string)
}

variable "disk_size_map" {
  description = "Compute Engine Machine Type"
  type        = map(number)
}

# GKE Cluster & GKE Nodes Variables
variable "enable_private_endpoint" {
  description = "GKE Enable Private Endpoint"
  type        = bool
}

variable "enable_private_nodes" {
  description = "GKE Enable Private Nodes"
  type        = bool
}

variable "deletion_protection" {
  description = "GKE Enable Private Nodes"
  type        = bool
}

variable "remove_default_node_pool" {
  description = "GKE Enable Private Nodes"
  type        = bool
}

variable "master_ip_range" {
  description = "Kubernetes Master IP range"
  type        = string
}

variable "cloudshell_source_ip_ranges" {
  description = "Source IP Address"
  type        = string
}

variable "source_ip_ranges" {
  description = "Source IP Address"
  type        = string
}

