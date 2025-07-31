output "iam_role_name" {
  description = "Name of the IAM Role"
  value       = aws_iam_role.this.name
}

output "iam_role_arn" {
  description = "ARN of the IAM Role"
  value       = aws_iam_role.this.arn
}

output "iam_role_id" {
  description = "ID of the IAM Role"
  value       = aws_iam_role.this.id
}
