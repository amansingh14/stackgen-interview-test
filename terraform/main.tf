locals {
  resource_group_name = "ec2.amazonaws.com"
  tags = {
    Environment = var.environment
    Project     = "spring-petclinic"
  }

}

module "kv_key" {
  source                  = "./modules/aws_kms_key"
  key_name                = "spring-petclinic-init-4"
  key_type                = "RSA"
  rsa_spec                = "RSA_2048"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 15
  enable_key_rotation     = true
}

module "identity" {
  source              = "./modules/aws_iam_role_identity"
  name                = "spring-petclinic-aws-role"
  assume_role_service = local.resource_group_name # or whichever service

}


module "policy_post_kv" {
  source         = "./modules/aws_iam_policy"
  name           = "spring-petclinic-init-key-access"
  description    = "Access to decrypt aws‑migrated KMS key"
  data_actions   = ["kms:Decrypt", "kms:Encrypt", "kms:Sign"]
  data_resources = [module.kv_key.kms_key_arn]
  principal_id   = module.identity.iam_role_name
  tags           = local.tags
}

module "policy_s3_bucket" {
  source         = "./modules/aws_iam_policy"
  name           = "spring-petclinic-access-to-s3-bucket"
  description    = "Access to s3 bucket"
  data_actions   = ["s3:GetObject", "s3:getBucketLocation", "s3:listBucket", "s3:DeleteObjectVersion"]
  data_resources = [module.s3_container.bucket_arn]
  principal_id   = module.identity.iam_role_name
  tags           = local.tags
}

module "db1" {
  source                        = "./modules/aws_rds_database"
  postgresql_server_name        = "spring-petclinic-db"
  postgresql_version            = "11"
  instance_class                = var.instance_class
  administrator_login           = var.username
  administrator_login_password  = var.administrator_login_password
  storage                       = 20
  max_allocated_storage         = 100
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = true
  public_network_access_enabled = false
  subnet_ids                    = var.subnet_ids
  security_group_ids            = var.security_group_ids
  db_name                       = var.database_name
  postgresql_configuration      = var.postgresql_configuration
  tags                          = local.tags
  iam_role_arn                  = module.identity.iam_role_arn
  kms_key_id                    = module.kv_key.kms_key_arn
}

module "db_replica" {
  source                        = "./modules/aws_rds_database"
  create_replica                = true
  replica_instance_class        = var.instance_class_replica
  replicate_source_db           = module.db1.db_instance_idenitifer
  postgresql_version            = "11"
  administrator_login           = var.username
  administrator_login_password  = var.administrator_login_password
  storage                       = 20
  iam_role_arn                  = module.identity.iam_role_arn
  postgresql_server_name        = "spring-petclinic-db2-replica"
  instance_class                = var.instance_class_replica
  subnet_ids                    = var.subnet_ids
  security_group_ids            = var.security_group_ids
  public_network_access_enabled = false
  kms_key_id                    = module.kv_key.kms_key_arn
}


module "redis" {
  source               = "./modules/aws_elasticache_redis"
  cache_name           = "spring-petclinic"
  instance_type        = var.instance_type
  capacity             = var.capacity
  redis_version        = var.redis_version
  parameter_group_name = var.parameter_group_name
  non_ssl_port_enabled = false
  maintenance_window   = "sun:02:00-sun:03:00"
  subnet_ids           = var.subnet_ids
  security_group_ids   = var.security_group_ids
  availability_zones   = var.availability_zones
  vpc_id               = var.vpc_id
  allowed_cidr_blocks  = ["172.31.0.0/20"]
  tags                 = local.tags
}

module "s3_container" {
  source = "./modules/aws_s3_bucket"
  name   = "spring-petclinic-aman"
  tags   = local.tags
}
