variable "kms_key" {
  description = "(필수) KMS KEY ID."
  type        = string
  nullable    = false
}

variable "policy" {
  description = "(필수) JSON 형식의 정책 문서."
  type        = string
  nullable    = false
}

variable "bypass_policy_lockout_safety_check" {
  description = "(선택) 키 정책을 생성하거나 업데이트할 때 수행되는 키 정책 잠금 안전 확인을 우회할지 여부. Default: `false`"
  type        = bool
  default     = false
  nullable    = false
}
