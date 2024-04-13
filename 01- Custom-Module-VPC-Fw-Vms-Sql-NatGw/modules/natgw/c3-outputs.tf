# NATGW PIP Output

output "natgw_public_ip_address" {
  description = "The Public IP address of the newly created NatGW"
  #value       = google_compute_instance.web_vm.network_interface.0.access_config.0.nat_ip
  value = google_compute_address.natgw_pip.address
}