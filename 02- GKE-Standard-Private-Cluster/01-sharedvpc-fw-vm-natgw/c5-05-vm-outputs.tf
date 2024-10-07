output "gke_vm_private_ip" {
  value = google_compute_instance.gke_vm.network_interface[0].network_ip
}

/*
output "gke_vm_public_ip" {
  value = google_compute_instance.gke_vm.network_interface[0].access_config[0].nat_ip
}
*/

output "natgw_public_ip1" {
  value       = google_compute_address.natgw_pip1.address
  description = "The public IP address of the newly created Nat Gateway"
}

output "natgw_public_ip2" {
  value       = google_compute_address.natgw_pip2.address
  description = "The public IP address of the newly created Nat Gateway"
}

