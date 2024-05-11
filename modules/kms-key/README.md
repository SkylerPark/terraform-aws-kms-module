# kms-key

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alias"></a> [alias](#module\_alias) | ../kms-alias | n/a |
| <a name="module_grant"></a> [grant](#module\_grant) | ../kms-grant | n/a |
| <a name="module_policy"></a> [policy](#module\_policy) | ../kms-key-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | (선택) 별칭의 표시 이름 집합. 이름은 다음 단어로 시작 `alias/`. | `set(string)` | `[]` | no |
| <a name="input_bypass_policy_lockout_safety_check"></a> [bypass\_policy\_lockout\_safety\_check](#input\_bypass\_policy\_lockout\_safety\_check) | (선택) 키 정책을 생성하거나 업데이트할 때 수행되는 키 정책 잠금 안전 확인을 우회할지 여부. Default: `false` | `bool` | `false` | no |
| <a name="input_custom_key_store"></a> [custom\_key\_store](#input\_custom\_key\_store) | (선택) KMS 대신 키가 저장될 KMS 사용자 지정 키 스토어의 ID. 단일 지역 대칭 암호화 KMS 만 가능. | `string` | `null` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | (선택) 리소스 폐기 후 키가 삭제되는 기간(일). `7` 부터 `30`일 까지 선택 가능. Default: `7`. | `number` | `7` | no |
| <a name="input_description"></a> [description](#input\_description) | (선택) KMS key 설명. | `string` | `"Managed by Terraform."` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (옵션) 키가 활성화되었는지 여부. Default: `true`. | `bool` | `true` | no |
| <a name="input_grants"></a> [grants](#input\_grants) | (선택) grants 생성에 대한 Map. | `any` | `{}` | no |
| <a name="input_key_rotation_enabled"></a> [key\_rotation\_enabled](#input\_key\_rotation\_enabled) | (선택) 키 순환이 활성화 여부. Default: `false`. | `bool` | `false` | no |
| <a name="input_multi_region_enabled"></a> [multi\_region\_enabled](#input\_multi\_region\_enabled) | (선택) 키가 다중 리전(true) 키인지 아니면 단일 리전(false) 키인지 여부. Default: (단일 리전) `false`. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) KMS key 이름. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | (선택) JSON 형식의 정책 문서. | `string` | `null` | no |
| <a name="input_spec"></a> [spec](#input\_spec) | (선택) 키에 대칭 키 또는 비대칭 키 쌍이 포함되어 있는지 여부와 키가 지원하는 암호화 알고리즘 또는 서명 알고리즘을 지정. 다음 값 선택 가능 `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `HMAC_256`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, `ECC_SECG_P256K1`. Default: `SYMMETRIC_DEFAULT`. | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용. | `map(string)` | `{}` | no |
| <a name="input_usage"></a> [usage](#input\_usage) | (선택) 키의 용도를 지정. 다음값 선택 가능 `ENCRYPT_DECRYPT`, `SIGN_VERIFY`, `GENERATE_VERIFY_MAC`. Default: `ENCRYPT_DECRYPT`. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_xks_key"></a> [xks\_key](#input\_xks\_key) | (선택) 외부 키 저장소에서 KMS 키의 키 자료 역할을 하는 외부 키의 ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aliases"></a> [aliases](#output\_aliases) | 키 별칭 리스트. |
| <a name="output_arn"></a> [arn](#output\_arn) | KMS key ARN. |
| <a name="output_custom_key_store"></a> [custom\_key\_store](#output\_custom\_key\_store) | KMS 대신 키가 저장될 KMS 사용자 지정 키 스토어의 ID. |
| <a name="output_deletion_window_in_days"></a> [deletion\_window\_in\_days](#output\_deletion\_window\_in\_days) | 리소스 폐기 후 키가 삭제되는 기간(일). |
| <a name="output_description"></a> [description](#output\_description) | KMS key 설명. |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | 키가 활성화되었는지 여부. |
| <a name="output_grants"></a> [grants](#output\_grants) | grant 리스트 |
| <a name="output_id"></a> [id](#output\_id) | KMS key ID. |
| <a name="output_key_rotation_enabled"></a> [key\_rotation\_enabled](#output\_key\_rotation\_enabled) | 키 순환이 활성화 여부. |
| <a name="output_multi_region_enabled"></a> [multi\_region\_enabled](#output\_multi\_region\_enabled) | 키가 다중 지역 키인지 여부. |
| <a name="output_name"></a> [name](#output\_name) | KMS Key 이름. |
| <a name="output_policy"></a> [policy](#output\_policy) | KMS Key Policy. |
| <a name="output_spec"></a> [spec](#output\_spec) | 암호화 알고리즘 또는 서명 알고리즘인 KMS 키 사양. |
| <a name="output_usage"></a> [usage](#output\_usage) | KMS key usage. |
| <a name="output_xks_key"></a> [xks\_key](#output\_xks\_key) | 외부 키 저장소에서 KMS 키의 키 자료 역할을 하는 외부 키의 ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
