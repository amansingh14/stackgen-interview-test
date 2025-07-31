variable "cache_name" {
  description = "The name of the ElastiCache Redis replication group."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the Redis nodes (e.g., cache.t3.micro)."
  type        = string
}

variable "capacity" {
  description = "The number of cache nodes to create (used as number_cache_clusters)."
  type        = number
}

variable "redis_version" {
  description = "The Redis engine version (e.g., 6.x, 7.x)."
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the parameter group to use for the Redis cluster."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache subnet group."
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the Redis cluster."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the Redis cluster will be deployed."
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the Redis cluster."
  type        = list(string)
}

variable "non_ssl_port_enabled" {
  description = "Enable non-SSL port (6379) if true; otherwise use TLS (6380)."
  type        = bool
  default     = false
}

variable "automatic_failover_enabled" {
  description = "Whether to enable automatic failover in the Redis cluster."
  type        = bool
  default     = true
}

variable "multi_az_enabled" {
  description = "Whether to enable Multi-AZ with automatic failover."
  type        = bool
  default     = true
}

variable "maintenance_window" {
  description = "Maintenance window in format 'sun:05:00-sun:06:00'."
  type        = string
}

variable "availability_zones" {
  description = "List of preferred availability zones for the Redis nodes."
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}