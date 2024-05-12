variable "name" {
  description = "KMS grant 이름"
  type        = string
  nullable    = false
}

variable "kms_key" {
  description = "(필수) KMS KEY ID."
  type        = string
  nullable    = false
}

variable "grantee_principal" {
  description = "(필수) ARN 형식으로 권한 부여가 허용하는 작업을 수행할 수 있는 권한이 부여된 보안 주체"
  type        = string
  nullable    = false
}

variable "operations" {
  description = "(필수) 허용하는 작업 목록. `Decrypt`, `Encrypt`, `GenerateDataKey`, `GenerateDataKeyWithoutPlaintext`, `ReEncryptFrom`, `ReEncryptTo`, `Sign`, `Verify`, `GetPublicKey`, `CreateGrant`, `RetireGrant`, `DescribeKey`, `GenerateDataKeyPair`, `GenerateDataKeyPairWithoutPlaintext`"
  type        = set(string)
  default     = []
  nullable    = false
}

variable "retiring_principal" {
  description = "(선택) ARN 형식의 RetireGrant 작업을 사용하여 부여를 폐기할 수 있는 권한이 부여된 보안 주체"
  type        = string
  default     = null
  nullable    = true
}

variable "grant_creation_tokens" {
  description = "(선택) 보조금을 생성할 때 사용할 보조금 토큰 목록"
  type        = list(string)
  default     = []
  nullable    = false
}

variable "retire_on_delete" {
  description = "(선택) `false` 삭제시 취소. `true` 삭제시 폐기. Default: `false`"
  type        = bool
  default     = false
  nullable    = false
}

variable "constraints" {
  description = <<EOF
  (선택) 암호화 컨텍스트가 있는 경우에만 권한 부여에서 특정 작업을 허용하는 데 사용. `constraints` 블록 내용.
    (선택) `enabled` - 암호화 컨텍스트 특정 작업 허용 여부. Default: `false`
    (선택) `encryption_context_equals` - 후속 암호화 작업 요청의 암호화 컨텍스트와 일치해야 하는 키-값 쌍 목록.
    (선택) `encryption_context_subset` - 후속 암호화 작업 요청의 암호화 컨텍스트에 포함되어야 하는 키-값 쌍 목록
  EOF

  type = object({
    enabled                   = optional(bool, false)
    encryption_context_equals = optional(set(string), [])
    encryption_context_subset = optional(set(string), [])
  })
}
