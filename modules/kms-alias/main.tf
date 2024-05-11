resource "aws_kms_alias" "this" {
  target_key_id = var.kms_key
  name          = var.name
}
