instance_class         = "db.t3.medium"
instance_class_replica = "db.t3.medium"
username               = "petclinic"
database_name          = "petclinic"
aws_region             = "ap-south-1"
vpc_id                 = "vpc-03ff072ae1d3dd045"
subnet_ids             = ["subnet-05b3f8bf94648d6d6", "subnet-0a7f6f84fe37fe7a6", "subnet-085934e0ccf202e5e"]
security_group_ids     = ["sg-08563fa19e801d40d"]
environment            = "dev"
postgresql_configuration = {
  "max_connections"            = "100"
  "log_min_duration_statement" = "2000"
  "rds.force_ssl"              = "1"
}

instance_type        = "cache.t3.micro"
capacity             = 2
redis_version        = "6.x"
parameter_group_name = "default.redis6.x"
availability_zones   = ["ap-south-1a", "ap-south-1b"]