resource "time_sleep" "cloud_sql_delay_create" {
  depends_on      = [google_service_networking_connection.private_vpc_connection]
  create_duration = "30s"
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "random_id" "db_name_suffix_replica" {
  byte_length = 4
}


resource "google_sql_database_instance" "mysql_server" {
  project          = var.project_id
  name             = "${var.vpc_name}-sql-${random_id.db_name_suffix.hex}"
  region           = var.gcp_region
  database_version = "MYSQL_8_0"

  deletion_protection = false

  settings {
    tier              = var.db_tier
    availability_type = var.db_availability_type
    disk_size         = var.db_disk_size
    disk_type         = var.db_disk_type
    disk_autoresize   = var.db_disk_autoresize

    backup_configuration {
      enabled            = true
      binary_log_enabled = true
      start_time         = "01:00"

      backup_retention_settings {
        retained_backups = 7
      }

    }

    ip_configuration {

      ipv4_enabled                                  = false # Disable public IP
      private_network                               = var.network_id
      enable_private_path_for_google_cloud_services = true
    }

    user_labels = {

      environment = "prod-db"
      app-name    = var.db_name
      vm-role     = "db"
    }

  }

  depends_on = [time_sleep.cloud_sql_delay_create]

}

resource "google_sql_database" "database" {
  project   = var.project_id
  name      = "${var.vpc_name}-appdb"
  instance  = google_sql_database_instance.mysql_server.name
  charset   = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  project  = var.project_id
  name     = "produser"
  password = "Abcd1234"
  host     = "%"
  instance = google_sql_database_instance.mysql_server.name
}

resource "google_sql_database_instance" "read_replica" {
  project          = var.project_id
  name             = "${var.vpc_name}-replica-${random_id.db_name_suffix_replica.hex}"
  master_instance_name = "${google_sql_database_instance.mysql_server.name}"
  region           = var.gcp_region_europe_west2
  database_version = "MYSQL_8_0"

  deletion_protection = false

   replica_configuration {
    failover_target = false
  }

  settings {
    tier              = var.db_tier
    availability_type = var.db_availability_type
    disk_size         = var.db_disk_size
    disk_type         = var.db_disk_type
    disk_autoresize   = var.db_disk_autoresize

    backup_configuration {
      enabled = false
    }

    ip_configuration {

      ipv4_enabled                                  = false # Disable public IP
      private_network                               = var.network_id
      enable_private_path_for_google_cloud_services = true
    }

     user_labels = {

      environment = "prod-db-replica"
      app-name    = "${var.db_name}-replica"
      vm-role     = "db-replica"
    }
  }

  depends_on = [google_sql_database_instance.mysql_server]

}