data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "custom_policy" {

  dynamic "statement" {
    for_each = var.data_actions != null ? [1] : []
    content {
      effect    = "Allow"
      actions   = var.data_actions
      resources = var.data_resources
    }
  }

}

resource "aws_iam_policy" "this" {
  name        = var.name
  description = var.description
  policy      = data.aws_iam_policy_document.custom_policy.json
  tags        = var.tags
  depends_on  = [data.aws_iam_policy_document.custom_policy]
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = var.principal_id
  policy_arn = aws_iam_policy.this.arn
}
