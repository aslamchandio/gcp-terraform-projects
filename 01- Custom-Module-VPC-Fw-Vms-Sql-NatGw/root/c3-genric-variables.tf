# Input Variables
variable "project_id" {
  description = "Project ID in which GCP resources to be created"
  type        = string
}
variable "gcp_region" {
  description = "Region in which GCP resources to be created"
  type        = string
}

variable "gcp_zone" {
  description = "Region in which GCP resources to be created"
  type        = string
}

variable "gcp_region_europe_west2" {
  description = "Region in which GCP resources to be created"
  type        = string
}


variable "gcp_zone_europe_west2" {
  description = "Region in which GCP resources to be created"
  type        = string
}

variable "source_ranges" {
  description = "Source IP Address"
  type        = string
}
