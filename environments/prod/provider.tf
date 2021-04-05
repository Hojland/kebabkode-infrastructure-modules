provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "mart-kebab-terraform-state"
    key    = "environments/prod"
    region = "eu-central-1"
  }
}
