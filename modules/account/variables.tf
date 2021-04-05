variable "aws_region" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

data "aws_caller_identity" "current" {}
