variable "name" {
  type        = string
  description = "Name of the custom IAM policy"
}

variable "description" {
  type        = string
  description = "Description of the custom IAM policy"
}

variable "actions" {
  type        = list(string)
  default     = []
  description = "List of allow actions"
}

variable "resources" {
  type        = list(string)
  default     = ["*"]
  description = "Resources for allowed actions"
}

variable "data_actions" {
  type    = list(string)
  default = []
}

variable "data_resources" {
  type    = list(string)
  default = ["*"]
}

variable "not_actions" {
  type    = list(string)
  default = []
}

variable "not_action_resources" {
  type    = list(string)
  default = ["*"]
}

variable "not_data_actions" {
  type    = list(string)
  default = []
}

variable "not_data_action_resources" {
  type    = list(string)
  default = ["*"]
}

variable "principal_id" {
  type        = string
  description = "The IAM Role name to attach this policy to"
}

variable "tags" {
  type    = map(string)
  default = {}
}
