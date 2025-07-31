# IAM Role (equivalent to user-assigned managed identity)
resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.tags
}

# Trust policy: allows EC2, Lambda, or another AWS service to assume this role
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = [var.assume_role_service] # e.g., "ec2.amazonaws.com", "lambda.amazonaws.com"
    }
  }
}
