output "kms_key_id" {
  description = "The globally unique identifier for the KMS key"
  sensitive   = false
  value       = aws_kms_key.this.id
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  sensitive   = false
  value       = aws_kms_key.this.arn
}

output "kms_key_alias_arn" {
  description = "The ARN of the KMS key alias"
  sensitive   = false
  value       = aws_kms_key.this.arn
}

output "kms_key_key_ring" {
  description = "The key ring for the KMS key (not applicable in AWS, placeholder if needed)"
  sensitive   = false
  value       = aws_kms_key.this.key_id
}
