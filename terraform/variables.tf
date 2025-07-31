variable "instance_class" {
  description = "Instance class for RDS primary instance (e.g., db.t3.medium)"
  type        = string
}

variable "instance_class_replica" {
  description = "Instance class for RDS read replica"
  type        = string
}

variable "administrator_login_password" {
  description = "Master password for the PostgreSQL instance"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group, Redis, etc."
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the RDS and Redis resources"
  type        = list(string)
}

variable "postgresql_configuration" {
  description = "Map of PostgreSQL parameter name-value pairs"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "Instance type for Redis (e.g., cache.t3.micro)"
  type        = string
}

variable "capacity" {
  description = "Number of Redis nodes (1 for cluster mode disabled)"
  type        = number
}

variable "redis_version" {
  description = "Redis engine version (e.g., 6.x)"
  type        = string
}

variable "parameter_group_name" {
  description = "Redis parameter group name"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for Redis cluster"
  type        = list(string)
}

variable "database_name" {
  description = "Name of the database in PostgreSQL"
  type        = string
}

variable "username" {
  description = "Username for the database user"
  type        = string
}

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "environment" {
  description = "Environment identifier (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the VPC containing the RDS instances"
  type        = string
}