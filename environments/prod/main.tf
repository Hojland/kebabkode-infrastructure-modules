variable "aws_region" {
  default = "eu-central-1"
}

variable "aws_profile" {
  default = "pizzakebab"
}

module "account" {
  source = "../../modules/account"

  aws_region       = "eu-central-1"
  environment_name = "prod"

  tags = {
    "Owner"       = "Martin",
    "Environment" = "Production"
  }
}


module "bert_guardian" {
  source = "../../modules/bert_guardian"

  aws_region           = "eu-central-1"
  guardian_bucket_name = "guardian-match-reports"
  environment_name     = "prod"
  bucket_access_user_arns = [module.account.robot_user_arn]

  tags = {
    "Owner"       = "Martin",
    "Environment" = "Production"
  }
}
