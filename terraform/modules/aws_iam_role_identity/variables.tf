variable "name" {
  type        = string
  description = "Name of the IAM role"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to IAM resources"
  default     = {}
}

variable "assume_role_service" {
  type        = string
  description = "AWS service to assume the role (e.g., ec2.amazonaws.com)"
}

variable "custom_role_definitions" {
  type = list(object({
    name    = string
    actions = list(string)
  }))
  default = []
}

variable "role_assignments" {
  type = list(object({
    managed_policy_arn = string
  }))
  default = []
}
