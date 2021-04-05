variable "aws_region" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "bucket_access_user_arns" {
  type = list(string)
  default = []
}

variable "guardian_bucket_name" {
  type = string
  default = "guardian_soccer_match_reports"
}

data "aws_caller_identity" "current" {}
