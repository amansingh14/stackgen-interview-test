resource "aws_kms_key" "this" {
  description              = var.key_name
  key_usage                = var.key_usage != null ? var.key_usage : "ENCRYPT_DECRYPT"
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  is_enabled               = true
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  rotation_period_in_days  = 90
  # Optional expiration-like behavior (KMS keys cannot expire but can be disabled)
  tags = {
    Name = var.key_name
  }
}
