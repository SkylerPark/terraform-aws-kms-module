resource "aws_kms_replica_key" "this" {
  description             = var.description
  is_enabled              = var.enabled
  deletion_window_in_days = var.deletion_window_in_days

  key_usage                = var.usage
  customer_master_key_spec = var.spec

  custom_key_store_id = var.custom_key_store
  xks_key_id          = var.xks_key
  multi_region        = var.multi_region_enabled
  enable_key_rotation = var.key_rotation_enabled
  valid_to            = var.valid_to

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}

module "policy" {
  source = "../kms-key-policy"
  count  = var.policy != null ? 1 : 0

  kms_key = aws_kms_key.this.id

  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
}

module "alias" {
  source   = "../kms-alias"
  for_each = toset(var.aliases)

  kms_key = aws_kms_key.this.id
  name    = each.key
}

module "grant" {
  source   = "../kms-grant"
  for_each = var.grants

  kms_key           = aws_kms_key.this.id
  name              = each.key
  grantee_principal = each.value.grantee_principal
  operations        = each.value.operations
  constraints       = each.value.constraints

  retiring_principal    = each.value.retiring_principal
  grant_creation_tokens = each.value.grant_creation_tokens
  retire_on_delete      = each.value.retire_on_delete
}
