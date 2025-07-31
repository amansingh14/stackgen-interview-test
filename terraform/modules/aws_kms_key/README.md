# AWS KMS Key Module

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
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | n/a | `number` | `30` | no |
| <a name="input_ec_spec"></a> [ec\_spec](#input\_ec\_spec) | n/a | `string` | `"ECC_NIST_P256"` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | n/a | `bool` | `true` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"my-kms-key"` | no |
| <a name="input_key_type"></a> [key\_type](#input\_key\_type) | n/a | `string` | `"RSA"` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | n/a | `string` | `""` | no |
| <a name="input_rsa_spec"></a> [rsa\_spec](#input\_rsa\_spec) | n/a | `string` | `"RSA_2048"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_alias_arn"></a> [kms\_key\_alias\_arn](#output\_kms\_key\_alias\_arn) | The ARN of the KMS key alias |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The ARN of the KMS key |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | The globally unique identifier for the KMS key |
| <a name="output_kms_key_key_ring"></a> [kms\_key\_key\_ring](#output\_kms\_key\_key\_ring) | The key ring for the KMS key (not applicable in AWS, placeholder if needed) |
