
variable "sub1_cidr" {
  description = "US Central1 Region in which GCP Resources to be created"
  type        = string
}

variable "sub2_cidr" {
  description = "US East1 Region in which GCP Resources to be created"
  type        = string
}

variable "proxy_sub1_cidr" {
  description = "US East1 Region in which GCP Resources to be created"
  type        = string
}

variable "pod_cidr1" {
  description = "US Central1 Region in which GCP Resources to be created"
  type        = string
}

variable "pod_cidr2" {
  description = "US Central1 Region in which GCP Resources to be created"
  type        = string
}

variable "service-cidr" {
  description = "US Central1 Region in which GCP Resources to be created"
  type        = string
}

variable "source_ip_ranges" {
  description = "Source IP Address"
  type        = string
}
