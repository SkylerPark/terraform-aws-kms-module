output "id" {
  description = "KMS alias ID"
  value       = aws_kms_alias.this.id
}

output "arn" {
  description = "KMS alias ARN"
  value       = aws_kms_alias.this.arn
}

output "name" {
  description = "KMS alias 이름"
  value       = aws_kms_alias.this.name
}
