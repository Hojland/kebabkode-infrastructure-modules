module "s3_state_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket_name
  acl    = "private"

  attach_public_policy = false
  block_public_acls    = true
  block_public_policy  = true

  versioning = {
    enabled = true
  }
}
