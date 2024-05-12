output "policy" {
  description = "KMS Key Policy."
  value       = aws_kms_key_policy.this.policy
}
