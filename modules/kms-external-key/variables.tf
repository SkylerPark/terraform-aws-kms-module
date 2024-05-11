variable "name" {
  description = "(필수) KMS key 이름."
  type        = string
  nullable    = false
}

variable "aliases" {
  description = "(선택) 별칭의 표시 이름 집합. 이름은 다음 단어로 시작 `alias/`."
  type        = set(string)
  default     = []
  nullable    = false
}

variable "description" {
  description = "(선택) KMS key 설명."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}

variable "enabled" {
  description = "(옵션) 키가 활성화되었는지 여부. Default: `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "deletion_window_in_days" {
  description = "(선택) 리소스 폐기 후 키가 삭제되는 기간(일). `7` 부터 `30`일 까지 선택 가능. Default: `7`."
  type        = number
  default     = 7
  nullable    = false

  validation {
    condition = alltrue([
      var.deletion_window_in_days >= 7,
      var.deletion_window_in_days <= 30,
    ])
    error_message = "Valid value is between `7` and `30` days."
  }
}

variable "usage" {
  description = "(선택) 키의 용도를 지정. 다음값 선택 가능 `ENCRYPT_DECRYPT`, `SIGN_VERIFY`, `GENERATE_VERIFY_MAC`. Default: `ENCRYPT_DECRYPT`."
  type        = string
  default     = "ENCRYPT_DECRYPT"
  nullable    = false

  validation {
    condition     = contains(["ENCRYPT_DECRYPT", "SIGN_VERIFY", "GENERATE_VERIFY_MAC"], var.usage)
    error_message = "Valid values are `ENCRYPT_DECRYPT`, `SIGN_VERIFY`, or `GENERATE_VERIFY_MAC`."
  }
}

variable "spec" {
  description = "(선택) 키에 대칭 키 또는 비대칭 키 쌍이 포함되어 있는지 여부와 키가 지원하는 암호화 알고리즘 또는 서명 알고리즘을 지정. 다음 값 선택 가능 `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `HMAC_256`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, `ECC_SECG_P256K1`. Default: `SYMMETRIC_DEFAULT`."
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  nullable    = false

  validation {
    condition = contains([
      "SYMMETRIC_DEFAULT",
      "RSA_2048",
      "RSA_3072",
      "RSA_4096",
      "HMAC_256",
      "ECC_NIST_P256",
      "ECC_NIST_P384",
      "ECC_NIST_P521",
      "ECC_SECG_P256K1",
    ], var.spec)
    error_message = "다음 값에서 지정 선택 해야 합니다. `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `HMAC_256`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, `ECC_SECG_P256K1`."
  }
}

variable "policy" {
  description = "(선택) JSON 형식의 정책 문서."
  type        = string
  default     = null
  nullable    = true
}

variable "valid_to" {
  description = "(선택) 가져온 키 자료가 만료되는 시간"
  type        = string
  default     = null
  nullable    = true
}

variable "bypass_policy_lockout_safety_check" {
  description = "(선택) 키 정책을 생성하거나 업데이트할 때 수행되는 키 정책 잠금 안전 확인을 우회할지 여부. Default: `false`"
  type        = bool
  default     = false
  nullable    = false
}

variable "custom_key_store" {
  description = "(선택) KMS 대신 키가 저장될 KMS 사용자 지정 키 스토어의 ID. 단일 지역 대칭 암호화 KMS 만 가능."
  type        = string
  default     = null
  nullable    = true
}

variable "xks_key" {
  description = "(선택) 외부 키 저장소에서 KMS 키의 키 자료 역할을 하는 외부 키의 ID."
  type        = string
  default     = null
  nullable    = true
}

variable "key_rotation_enabled" {
  description = "(선택) 키 순환이 활성화 여부. Default: `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "multi_region_enabled" {
  description = "(선택) 키가 다중 리전(true) 키인지 아니면 단일 리전(false) 키인지 여부. Default: (단일 리전) `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "grants" {
  description = "(선택) grants 생성에 대한 Map."
  type        = any
  default     = {}
  nullable    = false
}
