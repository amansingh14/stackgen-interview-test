# AWS IAM Policy Module

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
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions"></a> [actions](#input\_actions) | List of allow actions | `list(string)` | `[]` | no |
| <a name="input_data_actions"></a> [data\_actions](#input\_data\_actions) | n/a | `list(string)` | `[]` | no |
| <a name="input_data_resources"></a> [data\_resources](#input\_data\_resources) | n/a | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the custom IAM policy | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the custom IAM policy | `string` | n/a | yes |
| <a name="input_not_action_resources"></a> [not\_action\_resources](#input\_not\_action\_resources) | n/a | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_not_actions"></a> [not\_actions](#input\_not\_actions) | n/a | `list(string)` | `[]` | no |
| <a name="input_not_data_action_resources"></a> [not\_data\_action\_resources](#input\_not\_data\_action\_resources) | n/a | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_not_data_actions"></a> [not\_data\_actions](#input\_not\_data\_actions) | n/a | `list(string)` | `[]` | no |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The IAM Role name to attach this policy to | `string` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | Resources for allowed actions | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignment_id"></a> [role\_assignment\_id](#output\_role\_assignment\_id) | The value of the role\_assignment\_id output |
| <a name="output_role_definition_id"></a> [role\_definition\_id](#output\_role\_definition\_id) | The value of the role\_definition\_id output |
