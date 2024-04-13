# Input Variables
variable "db_name" {
  description = "DB Name in which GCP resources to be created"
  type        = string
}
variable "db_tier" {
  description = "DB Tier in which GCP resources to be created"
  type        = string
}

variable "db_availability_type" {
  description = "DB avl Type in which GCP resources to be created"
  type        = string
}


variable "db_disk_type" {
  description = "Disk  Type"
  type        = string
}

variable "db_disk_size" {
  description = "Disk Number"
  type        = number
}

variable "db_disk_autoresize" {
  description = "Disk Autoresize"
  type        = bool
}
