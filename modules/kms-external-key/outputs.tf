output "arn" {
  description = "KMS key ARN."
  value       = aws_kms_external_key.this.arn
}

output "id" {
  description = "KMS key ID."
  value       = aws_kms_external_key.this.key_id
}

output "name" {
  description = "KMS Key 이름."
  value       = var.name
}

output "description" {
  description = "KMS key 설명."
  value       = aws_kms_external_key.this.description
}

output "enabled" {
  description = "키가 활성화되었는지 여부."
  value       = aws_kms_external_key.this.is_enabled
}

output "deletion_window_in_days" {
  description = "리소스 폐기 후 키가 삭제되는 기간(일)."
  value       = aws_kms_external_key.this.deletion_window_in_days
}

output "usage" {
  description = "KMS key usage."
  value       = aws_kms_external_key.this.key_usage
}

output "spec" {
  description = "암호화 알고리즘 또는 서명 알고리즘인 KMS 키 사양."
  value       = aws_kms_external_key.this.customer_master_key_spec
}

output "policy" {
  description = "KMS Key Policy."
  value       = one(module.policy[*].policy)
}

output "custom_key_store" {
  description = "KMS 대신 키가 저장될 KMS 사용자 지정 키 스토어의 ID."
  value       = aws_kms_external_key.this.custom_key_store_id
}

output "xks_key" {
  description = "외부 키 저장소에서 KMS 키의 키 자료 역할을 하는 외부 키의 ID."
  value       = aws_kms_external_key.this.xks_key_id
}

output "key_rotation_enabled" {
  description = "키 순환이 활성화 여부."
  value       = aws_kms_external_key.this.enable_key_rotation
}

output "multi_region_enabled" {
  description = "키가 다중 지역 키인지 여부."
  value       = aws_kms_external_key.this.multi_region_enabled
}

output "aliases" {
  description = "키 별칭 리스트."
  value       = module.alias
}

output "grants" {
  description = "grant 리스트"
  value       = module.grant
}
