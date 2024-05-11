# kms-grant

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
| [aws_kms_grant.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_grant) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_constraints"></a> [constraints](#input\_constraints) | (선택) 암호화 컨텍스트가 있는 경우에만 권한 부여에서 특정 작업을 허용하는 데 사용. `constraints` 블록 내용.<br>    (선택) `enabled` - 암호화 컨텍스트 특정 작업 허용 여부. Default: `false`<br>    (선택) `encryption_context_equals` - 후속 암호화 작업 요청의 암호화 컨텍스트와 일치해야 하는 키-값 쌍 목록.<br>    (선택) `encryption_context_subset` - 후속 암호화 작업 요청의 암호화 컨텍스트에 포함되어야 하는 키-값 쌍 목록 | <pre>object({<br>    enabled                   = optional(bool, false)<br>    encryption_context_equals = optional(set(string), [])<br>    encryption_context_subset = optional(set(string), [])<br>  })</pre> | n/a | yes |
| <a name="input_grant_creation_tokens"></a> [grant\_creation\_tokens](#input\_grant\_creation\_tokens) | (선택) 보조금을 생성할 때 사용할 보조금 토큰 목록 | `list(string)` | `[]` | no |
| <a name="input_grantee_principal"></a> [grantee\_principal](#input\_grantee\_principal) | (필수) ARN 형식으로 권한 부여가 허용하는 작업을 수행할 수 있는 권한이 부여된 보안 주체 | `string` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | (필수) KMS KEY ID. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | KMS grant 이름 | `string` | n/a | yes |
| <a name="input_operations"></a> [operations](#input\_operations) | (필수) 허용하는 작업 목록. `Decrypt`, `Encrypt`, `GenerateDataKey`, `GenerateDataKeyWithoutPlaintext`, `ReEncryptFrom`, `ReEncryptTo`, `Sign`, `Verify`, `GetPublicKey`, `CreateGrant`, `RetireGrant`, `DescribeKey`, `GenerateDataKeyPair`, `GenerateDataKeyPairWithoutPlaintext` | `set(string)` | `[]` | no |
| <a name="input_retire_on_delete"></a> [retire\_on\_delete](#input\_retire\_on\_delete) | (선택) `false` 삭제시 취소. `true` 삭제시 폐기. Default: `false` | `bool` | `false` | no |
| <a name="input_retiring_principal"></a> [retiring\_principal](#input\_retiring\_principal) | (선택) ARN 형식의 RetireGrant 작업을 사용하여 부여를 폐기할 수 있는 권한이 부여된 보안 주체 | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | KMS grant ID |
| <a name="output_token"></a> [token](#output\_token) | KMS grant Token |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
