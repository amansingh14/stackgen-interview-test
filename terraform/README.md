## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db1"></a> [db1](#module\_db1) | ./modules/aws_rds_database | n/a |
| <a name="module_db_replica"></a> [db\_replica](#module\_db\_replica) | ./modules/aws_rds_database | n/a |
| <a name="module_identity"></a> [identity](#module\_identity) | ./modules/aws_iam_role_identity | n/a |
| <a name="module_kv_key"></a> [kv\_key](#module\_kv\_key) | ./modules/aws_kms_key | n/a |
| <a name="module_policy_post_kv"></a> [policy\_post\_kv](#module\_policy\_post\_kv) | ./modules/aws_iam_policy | n/a |
| <a name="module_policy_s3_bucket"></a> [policy\_s3\_bucket](#module\_policy\_s3\_bucket) | ./modules/aws_iam_policy | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/aws_elasticache_redis | n/a |
| <a name="module_s3_container"></a> [s3\_container](#module\_s3\_container) | ./modules/aws_s3_bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | Master password for the PostgreSQL instance | `string` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones for Redis cluster | `list(string)` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where resources will be created | `string` | n/a | yes |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Number of Redis nodes (1 for cluster mode disabled) | `number` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database in PostgreSQL | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment identifier (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class for RDS primary instance (e.g., db.t3.medium) | `string` | n/a | yes |
| <a name="input_instance_class_replica"></a> [instance\_class\_replica](#input\_instance\_class\_replica) | Instance class for RDS read replica | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for Redis (e.g., cache.t3.micro) | `string` | n/a | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Redis parameter group name | `string` | n/a | yes |
| <a name="input_postgresql_configuration"></a> [postgresql\_configuration](#input\_postgresql\_configuration) | Map of PostgreSQL parameter name-value pairs | `map(string)` | `{}` | no |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | Redis engine version (e.g., 6.x) | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs for the RDS and Redis resources | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the DB subnet group, Redis, etc. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the database user | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for the VPC containing the RDS instances | `string` | n/a | yes |

## Outputs

No outputs.
