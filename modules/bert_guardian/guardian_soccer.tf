data "aws_iam_policy_document" "guardian_bucket_access_allow" {
  statement {
    sid = "1"

    effect = "Allow"

    actions = ["s3:*"]

    principals {
      type        = "AWS"
      identifiers = concat([data.aws_caller_identity.current.account_id], var.bucket_access_user_arns)
    }
    # in the future we should add 

    resources = [
      "arn:aws:s3:::${var.guardian_bucket_name}",
      "arn:aws:s3:::${var.guardian_bucket_name}/*"
    ]
  }
}

resource "aws_s3_bucket" "guardian_bucket" {
  bucket = var.guardian_bucket_name

  policy = data.aws_iam_policy_document.guardian_bucket_access_allow.json

  tags = merge(var.tags, map("Use", "Guardian Bert Project"))
}

resource "aws_s3_bucket_public_access_block" "guardian_bucket_access_block" {
  bucket = aws_s3_bucket.guardian_bucket.id

  block_public_acls   = false
  block_public_policy = false
}
