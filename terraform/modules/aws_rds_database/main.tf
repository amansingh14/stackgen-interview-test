resource "aws_db_instance" "this" {
  identifier                      = var.postgresql_server_name
  engine                          = "postgres"
  engine_version                  = var.postgresql_version
  instance_class                  = var.instance_class
  username                        = var.administrator_login
  password                        = var.administrator_login_password
  allocated_storage               = var.storage
  storage_encrypted               = true
  backup_retention_period         = var.backup_retention_days
  multi_az                        = var.geo_redundant_backup_enabled
  auto_minor_version_upgrade      = true
  db_name                         = var.db_name
  max_allocated_storage           = var.max_allocated_storage
  parameter_group_name            = aws_db_parameter_group.this.name
  publicly_accessible             = var.public_network_access_enabled
  storage_type                    = var.storage_type # e.g. "gp2", "gp3"
  db_subnet_group_name            = aws_db_subnet_group.this.name
  vpc_security_group_ids          = var.security_group_ids
  apply_immediately               = true
  deletion_protection             = true
  skip_final_snapshot             = false
  final_snapshot_identifier       = "${var.postgresql_server_name}-final-snapshot"
  enabled_cloudwatch_logs_exports = ["postgresql"]
  kms_key_id                      = var.kms_key_id
  tags                            = var.tags
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.postgresql_server_name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.postgresql_server_name}-subnet-group"
  }
}

resource "aws_db_parameter_group" "this" {
  name        = "${var.postgresql_server_name}-param-group"
  family      = "postgres${replace(var.postgresql_version, ".", "")}"
  description = "Custom parameter group for ${var.postgresql_server_name}"

  dynamic "parameter" {
    for_each = var.postgresql_configuration != null ? var.postgresql_configuration : {}
    content {
      name         = parameter.key
      value        = parameter.value
      apply_method = "pending-reboot"
    }
  }

  tags = var.tags
}

resource "aws_db_instance_role_association" "replica" {
  count                  = var.create_replica && var.iam_role_arn != "" ? var.replica_count : 0
  db_instance_identifier = aws_db_instance.replicas[count.index].identifier
  feature_name           = "IAMDatabaseAuthentication"
  role_arn               = var.iam_role_arn
}

resource "aws_db_instance" "replicas" {
  count                        = var.create_replica ? var.replica_count : 0
  identifier                   = "${var.postgresql_server_name}-replica-${count.index + 1}"
  replicate_source_db          = var.replicate_source_db
  instance_class               = var.replica_instance_class != null ? var.replica_instance_class : var.instance_class
  publicly_accessible          = var.public_network_access_enabled
  storage_type                 = var.storage_type
  db_subnet_group_name         = aws_db_subnet_group.this.name
  vpc_security_group_ids       = var.security_group_ids
  apply_immediately            = true
  auto_minor_version_upgrade   = true
  monitoring_interval          = 60
  performance_insights_enabled = true
  storage_encrypted            = true
  kms_key_id                   = var.kms_key_id
  tags = merge(var.tags, {
    Role = "replica"
  })

  depends_on = [
    aws_db_instance.this,
    aws_db_parameter_group.this,
    aws_db_subnet_group.this
  ]
}
