resource "aws_kms_grant" "this" {
  name              = var.name
  key_id            = var.kms_key
  grantee_principal = var.grantee_principal
  operations        = var.operations

  dynamic "constraints" {
    for_each = var.constraints.enabled ? ["go"] : []

    content {
      encryption_context_equals = try(constraints.value.encryption_context_equals, null)
      encryption_context_subset = try(constraints.value.encryption_context_subset, null)
    }
  }

  retiring_principal    = var.retiring_principal
  grant_creation_tokens = var.grant_creation_tokens
  retire_on_delete      = var.retire_on_delete
}
