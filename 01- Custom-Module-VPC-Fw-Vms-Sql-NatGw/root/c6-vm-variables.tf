variable "vm_image_ubuntu" {
  description = "VM Image Type in which GCP resources to be created"
  type        = string
}

variable "vm_image_centos" {
  description = "VM Image Type in which GCP resources to be created"
  type        = string
}

variable "vm_machine_type" {
  description = "VM Machine Type in which GCP resources to be created"
  type        = map(string)
}

variable "vm_boot_disk_size" {
  description = "VM Boot Disk Size in which GCP resources to be created"
  type        = number
}

variable "vm_boot_disk_type" {
  description = "VM Boot Disk type in which GCP resources to be created"
  type        = string
}


variable "web_vm_tags" {
  description = "Tags of Vms"
  type        = list(string)
}

variable "db_vm_tags" {
  description = "Tags of Vms"
  type        = list(string)
}

variable "app_name" {
  description = "App VM Name"
  type        = list(string)
}
