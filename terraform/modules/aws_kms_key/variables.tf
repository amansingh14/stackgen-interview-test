variable "key_usage" {
  default = ""
}

variable "key_type" {
  type    = string
  default = "RSA"
}

variable "rsa_spec" {
  type    = string
  default = "RSA_2048" # Options: RSA_2048, RSA_3072, RSA_4096
}

variable "ec_spec" {
  type    = string
  default = "ECC_NIST_P256" # Options: ECC_NIST_P256, ECC_NIST_P384, etc.
}

variable "key_name" {
  type    = string
  default = "my-kms-key"
}

variable "enable_key_rotation" {
  type    = bool
  default = true
}

variable "deletion_window_in_days" {
  type    = number
  default = 30
}
