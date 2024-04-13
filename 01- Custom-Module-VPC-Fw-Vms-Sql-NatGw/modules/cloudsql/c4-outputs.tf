output "master_instance_name" {
  value       = google_sql_database_instance.mysql_server.name
  description = "The instance name for the master instance"
}

output "master_private_address" {
  value       = google_sql_database_instance.mysql_server.private_ip_address
  description = "The private IP address assigned for the master instance"
}


output "master_instance_connection_name" {
  value       = google_sql_database_instance.mysql_server.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "read_replica_instance_name" {
  value       = google_sql_database_instance.read_replica.name
  description = "The instance name for the master instance"
}

output "read_replica_private_address" {
  value       = google_sql_database_instance.read_replica.private_ip_address
  description = "The private IP address assigned for the master instance"
}


output "read_replica_instance_connection_name" {
  value       = google_sql_database_instance.read_replica.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}