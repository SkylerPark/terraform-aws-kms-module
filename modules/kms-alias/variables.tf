variable "kms_key" {
  description = "(필수) KMS KEY ID."
  type        = string
  nullable    = false
}

variable "name" {
  description = "(필수) KMS alias 이름"
  type        = string
  nullable    = false
}
