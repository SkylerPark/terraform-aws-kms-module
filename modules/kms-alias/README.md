# kms-alias

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | (필수) KMS KEY ID. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (필수) KMS alias 이름 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | KMS alias ARN |
| <a name="output_id"></a> [id](#output\_id) | KMS alias ID |
| <a name="output_name"></a> [name](#output\_name) | KMS alias 이름 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
