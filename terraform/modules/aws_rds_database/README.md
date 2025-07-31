# AWS RDS Database Module

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.replicas](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_instance_role_association.replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance_role_association) | resource |
| [aws_db_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | Master username for the PostgreSQL instance | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | Master password for the PostgreSQL instance | `string` | n/a | yes |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Number of days to retain backups | `number` | `7` | no |
| <a name="input_create_replica"></a> [create\_replica](#input\_create\_replica) | Whether to create a read replica of the DB instance | `bool` | `false` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of your database. | `string` | `""` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Whether to enable multi-AZ deployment | `bool` | `false` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | IAM role ARN to associate with the RDS cluster for authentication | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class for RDS (e.g., db.t3.medium) | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key ID used for encryption at rest. | `string` | `""` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | Maximum allocated storage size for the Redis cluster. | `number` | `null` | no |
| <a name="input_postgresql_configuration"></a> [postgresql\_configuration](#input\_postgresql\_configuration) | Map of PostgreSQL parameter name-value pairs | `map(string)` | `{}` | no |
| <a name="input_postgresql_server_name"></a> [postgresql\_server\_name](#input\_postgresql\_server\_name) | Name of the RDS PostgreSQL instance | `string` | n/a | yes |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | PostgreSQL engine version (e.g., 14.7) | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether the database is publicly accessible | `bool` | `false` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | Number of read replicas to create | `number` | `0` | no |
| <a name="input_replica_instance_class"></a> [replica\_instance\_class](#input\_replica\_instance\_class) | Instance class for the read replica | `string` | `null` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | Identifier of the source database from which to replicate data. | `string` | `""` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of VPC security group IDs for the RDS instance | `list(string)` | n/a | yes |
| <a name="input_storage"></a> [storage](#input\_storage) | Storage in MB (RDS uses GB, so this will be converted) | `number` | n/a | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type: gp2, gp3, or io1 | `string` | `"gp3"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the DB subnet group | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_idenitifer"></a> [db\_instance\_idenitifer](#output\_db\_instance\_idenitifer) | The value of the db\_instance\_idenitifer output |
| <a name="output_postgresql_database_id"></a> [postgresql\_database\_id](#output\_postgresql\_database\_id) | The value of the postgresql\_database\_id output |
| <a name="output_postgresql_server_id"></a> [postgresql\_server\_id](#output\_postgresql\_server\_id) | The value of the postgresql\_server\_id output |
