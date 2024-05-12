output "id" {
  description = "KMS grant ID"
  value       = aws_kms_grant.this.grant_id
}

output "token" {
  description = "KMS grant Token"
  value       = aws_kms_grant.this.grant_token
}
