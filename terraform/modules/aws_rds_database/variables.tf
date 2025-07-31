variable "postgresql_server_name" {
  description = "Name of the RDS PostgreSQL instance"
  type        = string
}

variable "postgresql_version" {
  description = "PostgreSQL engine version (e.g., 14.7)"
  type        = string
}

variable "instance_class" {
  description = "Instance class for RDS (e.g., db.t3.medium)"
  type        = string
}

variable "administrator_login" {
  description = "Master username for the PostgreSQL instance"
  type        = string
}

variable "administrator_login_password" {
  description = "Master password for the PostgreSQL instance"
  type        = string
  sensitive   = true
}

variable "storage" {
  description = "Storage in MB (RDS uses GB, so this will be converted)"
  type        = number
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Whether to enable multi-AZ deployment"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether the database is publicly accessible"
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "Storage type: gp2, gp3, or io1"
  type        = string
  default     = "gp3"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of VPC security group IDs for the RDS instance"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "postgresql_configuration" {
  description = "Map of PostgreSQL parameter name-value pairs"
  type        = map(string)
  default     = {}
}

variable "iam_role_arn" {
  description = "IAM role ARN to associate with the RDS cluster for authentication"
  type        = string
}

variable "create_replica" {
  type        = bool
  default     = false
  description = "Whether to create a read replica of the DB instance"
}

variable "replica_count" {
  type        = number
  default     = 0
  description = "Number of read replicas to create"
}

variable "replica_instance_class" {
  type        = string
  default     = null
  description = "Instance class for the read replica"
}

variable "replicate_source_db" {
  type = string
  description = "Identifier of the source database from which to replicate data."
  default = ""
}

variable "db_name" {
  type = string
  description = "The name of your database."
  default = ""
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage size for the Redis cluster."
  type        = number
  default     = null
}

variable "kms_key_id" {
  description = "KMS key ID used for encryption at rest."
  type        = string
  default     = ""
}
