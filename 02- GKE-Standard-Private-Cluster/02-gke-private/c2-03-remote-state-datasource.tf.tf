
data "terraform_remote_state" "project1_data" {
  backend = "gcs"
  config = {
     bucket = "terraform-state-bucket"
    prefix = "prod/shared-vpc-vm-fw"

  }

}

output "vpc_name" {
  description = "VPC Name"
  value       = data.terraform_remote_state.project1_data.outputs.vpc_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = data.terraform_remote_state.project1_data.outputs.vpc_id
}

output "subnet1_id" {
  description = "Subnet1 ID"
  value       = data.terraform_remote_state.project1_data.outputs.subnet1_id
}

output "pod_cidr1_name" {
  description = "POD1 CIDR"
  value       = data.terraform_remote_state.project1_data.outputs.pod_cidr1_name
}

output "pod_cidr2_name" {
  description = "POD2 CIDR"
  value       = data.terraform_remote_state.project1_data.outputs.pod_cidr2_name
}

output "service_cidr_name" {
  description = "Service CIDR"
  value       = data.terraform_remote_state.project1_data.outputs.service_cidr_name
}

output "subnet2_cidr" {
  description = "Subnet1 ID"
  value       = data.terraform_remote_state.project1_data.outputs.subnet2_cidr
}

output "name_iap" {
  description = "Subnet1 ID"
  value       = data.terraform_remote_state.project1_data.outputs.name_iap
}