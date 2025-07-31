resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.cache_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id        = var.cache_name
  description                 = "Redis replication group for ${var.cache_name}"
  node_type                   = var.instance_type
  num_cache_clusters          = var.capacity
  engine                      = "redis"
  engine_version              = var.redis_version
  parameter_group_name        = var.parameter_group_name
  port                        = var.non_ssl_port_enabled ? 6379 : 6380
  automatic_failover_enabled  = var.automatic_failover_enabled
  multi_az_enabled            = var.multi_az_enabled
  subnet_group_name           = aws_elasticache_subnet_group.this.name
  security_group_ids          = var.security_group_ids
  at_rest_encryption_enabled  = true
  transit_encryption_enabled  = !var.non_ssl_port_enabled
  maintenance_window          = var.maintenance_window
  preferred_cache_cluster_azs = var.availability_zones
  apply_immediately           = true
  tags                        = var.tags
}


resource "aws_security_group" "redis" {
  name        = "${var.cache_name}-sg"
  description = "Allow Redis access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.non_ssl_port_enabled ? 6379 : 6380
    to_port     = var.non_ssl_port_enabled ? 6379 : 6380
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks # e.g., ["192.168.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
