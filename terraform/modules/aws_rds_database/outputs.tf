output "postgresql_database_id" {
  description = "The value of the postgresql_database_id output"
  value       = aws_db_instance.this.id
  sensitive   = false
}

output "postgresql_server_id" {
  description = "The value of the postgresql_server_id output"
  value       = aws_db_instance.this.arn
  sensitive   = false
}

output "db_instance_idenitifer" {
  description = "The value of the db_instance_idenitifer output"
  value       = aws_db_instance.this.identifier
  sensitive   = false
}