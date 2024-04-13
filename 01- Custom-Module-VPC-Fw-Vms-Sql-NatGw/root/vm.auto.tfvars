# General Variables Values

vm_image_ubuntu = "ubuntu-2204-jammy-v20240119a"
vm_image_centos = "centos-stream-8-v20240110"
vm_machine_type = {

  "web" = "e2-medium"
  "db"  = "e2-small"
  "app" = "e2-micro"

}


vm_boot_disk_size = 20
vm_boot_disk_type = "pd-balanced"
web_vm_tags       = ["ssh-allow", "http-allow", "iap-allow", "health-check-allow"]
db_vm_tags        = ["iap-allow", "health-check-allow"]

app_name = ["app-vm1", "app-vm2"]

