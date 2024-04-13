variable "vpc_name" {
  description = "VPC Name in which GCP Resources to be created"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Auto Create Subnetwork False"
  type        = bool
}

variable "subnet_ip_ranges" {
  description = "US Central1 Region in which GCP Resources to be created"
  type        = map(string)
}

variable "subnet_cidrs" {
  type        = list(string)
  description = "Subnet CIDR values"
}

variable "subnets_name" {
  description = "Europe West2 Region in which GCP Resources to be created"
  type        = list(string)
}


