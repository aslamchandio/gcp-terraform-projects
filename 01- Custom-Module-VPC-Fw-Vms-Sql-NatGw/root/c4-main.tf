module "vpc" {

  source = "../modules/vpc"

  project_id              = var.project_id
  gcp_region              = var.gcp_region
  gcp_region_europe_west2 = var.gcp_region_europe_west2
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  subnet_ip_ranges        = var.subnet_ip_ranges
  subnet_cidrs            = var.subnet_cidrs
  subnets_name            = var.subnets_name

}

module "firewall" {
  source = "../modules/firewall"

  vpc_name      = var.vpc_name
  source_ranges = var.source_ranges

  network_id   = module.vpc.network_id
  subnet1_cidr = module.vpc.subnet1_cidr
  subnet2_cidr = module.vpc.subnet2_cidr
  subnet3_cidr = module.vpc.subnet3_cidr
  subnet4_cidr = module.vpc.subnet4_cidr

}

module "vm" {
  source = "../modules/vm"

  project_id              = var.project_id
  vpc_name                = var.vpc_name
  gcp_zone                = var.gcp_zone
  gcp_region_europe_west2 = var.gcp_region_europe_west2
  gcp_zone_europe_west2   = var.gcp_zone_europe_west2
  vm_image_ubuntu         = var.vm_image_ubuntu
  vm_image_centos         = var.vm_image_centos
  vm_machine_type         = var.vm_machine_type
  vm_boot_disk_size       = var.vm_boot_disk_size
  vm_boot_disk_type       = var.vm_boot_disk_type
  web_vm_tags             = var.web_vm_tags
  db_vm_tags              = var.db_vm_tags
  app_name                = var.app_name

  network_id   = module.vpc.network_id
  subnet1_name = module.vpc.subnet1_name
  subnet2_name = module.vpc.subnet2_name
  subnet3_name = module.vpc.subnet3_name

}

module "natgw" {
  source = "../modules/natgw"

  vpc_name                = var.vpc_name
  gcp_region_europe_west2 = var.gcp_region_europe_west2

  network_id   = module.vpc.network_id
  subnet2_name = module.vpc.subnet2_name
  subnet3_name = module.vpc.subnet3_name
  subnet4_name = module.vpc.subnet4_name

}

module "sa" {
  source = "../modules/sa"

  project_id = var.project_id
  gcp_region = var.gcp_region

}

module "cloudsql" {
  source = "../modules/cloudsql"

  project_id              = var.project_id
  gcp_region              = var.gcp_region
  vpc_name                = var.vpc_name
  gcp_region_europe_west2 = var.gcp_region_europe_west2
  db_name                 = var.db_name
  db_tier                 = var.db_tier
  db_availability_type    = var.db_availability_type
  db_disk_type            = var.db_disk_type
  db_disk_size            = var.db_disk_size
  db_disk_autoresize      = var.db_disk_autoresize

  network_id = module.vpc.network_id

}



