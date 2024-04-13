#VPC Outputs
/*
output "network" {
  value       = module.vpc.network
  description = "The VPC resource being created"
}
*/
output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "network_id" {
  value = module.vpc.network_id
}

output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC being created"
}

output "network_project_id" {
  value       = module.vpc.network_project_id
  description = "VPC project id"
}


#First Subnet Output

output "subnet1_name" {
  value       = module.vpc.subnet1_name
  description = "The name of the subnetwork"
}

output "subnet1_cidr" {
  value       = module.vpc.subnet1_cidr
  description = "Primary CIDR range"
}

output "subnet1_self_link" {
  value       = module.vpc.subnet1_self_link
  description = "The URI of the created resource"
}

#Second Subnet Output

output "subnet2_name" {
  value       = module.vpc.subnet2_name
  description = "The name of the subnetwork"
}

output "subnet2_cidr" {
  value       = module.vpc.subnet2_cidr
  description = "Primary CIDR range"
}

output "subnet2_self_link" {
  value       = module.vpc.subnet2_self_link
  description = "The URI of the created resource"
}

#Third Subnet Output

output "subnet3_name" {
  value       = module.vpc.subnet3_name
  description = "The name of the subnetwork"
}

output "subnet3_cidr" {
  value       = module.vpc.subnet3_cidr
  description = "Primary CIDR range"
}

output "subnet3_self_link" {
  value       = module.vpc.subnet3_self_link
  description = "The URI of the created resource"
}

#Fourth Subnet Output

output "subnet4_name" {
  value       = module.vpc.subnet4_name
  description = "The name of the subnetwork"
}

output "subnet4_cidr" {
  value       = module.vpc.subnet4_cidr
  description = "Primary CIDR range"
}

output "subnet4_self_link" {
  value       = module.vpc.subnet4_self_link
  description = "The URI of the created resource"
}

output "pod_cidr_name" {
  value       = module.vpc.pod_cidr_name
  description = "Name of the secondary CIDR range"
}

output "pod_cidr" {
  value       = module.vpc.pod_cidr
  description = "Secondary CIDR range"
}

output "service_cidr_name" {
  value       = module.vpc.service_cidr_name
  description = "Name of the secondary CIDR range"
}

output "service_cidr" {
  value       = module.vpc.service_cidr
  description = "Secondary CIDR range"
}

# Firewall Outputs

# For SSH Allow
output "name_ssh" {
  value       = module.firewall.name_ssh
  description = "The name of the firewall rule being created"
}

output "network_name_ssh" {
  value       = module.firewall.network_name_ssh
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_ssh" {
  value       = module.firewall.rule_self_link_ssh
  description = "The URI of the firewall rule  being created"
}

#For RDP Allow
output "name_rdp" {
  value       = module.firewall.name_rdp
  description = "The name of the firewall rule being created"
}

output "network_name_rdp" {
  value       = module.firewall.network_name_rdp
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_rdp" {
  value       = module.firewall.rule_self_link_rdp
  description = "The URI of the firewall rule  being created"
}

# For HTTP Allow
output "name_http" {
  value       = module.firewall.name_http
  description = "The name of the firewall rule being created"
}

output "network_name_http" {
  value       = module.firewall.network_name_http
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_http" {
  value       = module.firewall.rule_self_link_http
  description = "The URI of the firewall rule  being created"
}


# For Internal Allow
output "name_internal" {
  value       = module.firewall.name_internal
  description = "The name of the firewall rule being created"
}

output "network_name_internal" {
  value       = module.firewall.network_name_internal
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_internal" {
  value       = module.firewall.rule_self_link_internal
  description = "The URI of the firewall rule  being created"
}

# For IAP Allow
output "name_iap" {
  value       = module.firewall.name_iap
  description = "The name of the firewall rule being created"
}

output "network_name_iap" {
  value       = module.firewall.network_name_iap
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_iap" {
  value       = module.firewall.rule_self_link_iap
  description = "The URI of the firewall rule  being created"
}

# For Health Check Allow
output "name_health_check" {
  value       = module.firewall.name_health_check
  description = "The name of the firewall rule being created"
}

output "network_name_health_check" {
  value       = module.firewall.network_name_health_check
  description = "The name of the VPC network where the firewall rule will be applied"
}

output "rule_self_link_health_check" {
  value       = module.firewall.rule_self_link_health_check
  description = "The URI of the firewall rule  being created"
}

# Web VM Output
output "web_vm_private_ip_address" {
  description = "The Private IP address of the newly created instance"
  value       = module.vm.web_vm_private_ip_address
}
output "web_vm_public_ip_address" {
  description = "The Public IP address of the newly created instance"
  #value       = google_compute_instance.web_vm.network_interface.0.access_config.0.nat_ip
  value = module.vm.web_vm_public_ip_address
}

# DB VM Output
output "db_vm_private_ip_address" {
  description = "The Private IP address of the newly created instance"
  value       = module.vm.db_vm_private_ip_address
}

/*
# App VM Output
output "app_vm1_private_ip_address" {
  description = "The App VM1 IP address of the newly created instance"
  value       = module.vm.app_vm1_private_ip_address
}

output "app_vm2_private_ip_address" {
  description = "The App VM2 IP address of the newly created instance"
  value       = module.vm.app_vm2_private_ip_address
}

*/

output "app_vm_id" {
  description = "The App VM2 IP address of the newly created instance"
  value       = module.vm.app_vm_id
}

output "natgw_public_ip_address" {
  description = "The Public IP address of the newly created NatGW"
  #value       = google_compute_instance.web_vm.network_interface.0.access_config.0.nat_ip
  value = module.natgw.natgw_public_ip_address
}

# Cloud SQL OUTPUTS

output "master_instance_name" {
  value       = module.cloudsql.master_instance_name
  description = "The instance name for the master instance"
}

output "master_private_address" {
  value       = module.cloudsql.master_private_address
  description = "The private IP address assigned for the master instance"
}


output "master_instance_connection_name" {
  value       = module.cloudsql.master_instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "read_replica_instance_name" {
  value       = module.cloudsql.read_replica_instance_name
  description = "The instance name for the master instance"
}

output "read_replica_private_address" {
  value       = module.cloudsql.read_replica_private_address
  description = "The private IP address assigned for the master instance"
}


output "read_replica_instance_connection_name" {
  value       = module.cloudsql.read_replica_instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}
