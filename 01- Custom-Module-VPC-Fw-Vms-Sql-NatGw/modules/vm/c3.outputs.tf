# Web VM Output
output "web_vm_private_ip_address" {
  description = "The Private IP address of the newly created instance"
  value       = google_compute_instance.web_vm.network_interface.0.network_ip
}
output "web_vm_public_ip_address" {
  description = "The Public IP address of the newly created instance"
  value       = google_compute_instance.web_vm.network_interface.0.access_config.0.nat_ip
  #value = google_compute_address.web_pip.address
}

# DB VM Output
output "db_vm_private_ip_address" {
  description = "The Private IP address of the newly created instance"
  value       = google_compute_instance.db_vm.network_interface.0.network_ip
}

/*
# App VM Output
output "app_vm1_private_ip_address" {
  description = "The App VM1 IP address of the newly created instance"
  value       = google_compute_instance.app_vm[0].network_interface[0].network_ip
}

output "app_vm2_private_ip_address" {
  description = "The App VM2 IP address of the newly created instance"
  value       = google_compute_instance.app_vm[1].network_interface[0].network_ip
}

*/

output "app_vm_id" {
  description = "Web VMs Instance ID"
  value = toset([
    for instance in google_compute_instance.app_vm : instance.id
  ]) 
} 