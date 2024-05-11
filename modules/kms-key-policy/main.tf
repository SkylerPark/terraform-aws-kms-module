resource "aws_kms_key_policy" "this" {
  key_id = var.kms_key

  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
}
