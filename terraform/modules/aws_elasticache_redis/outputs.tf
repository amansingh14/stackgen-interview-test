output "id" {
  description = "The value of the replication group ID output"
  sensitive   = false
  value       = aws_elasticache_replication_group.this.id
}

output "name" {
  description = "The value of the replication group name output"
  sensitive   = false
  value       = aws_elasticache_replication_group.this.replication_group_id
}

