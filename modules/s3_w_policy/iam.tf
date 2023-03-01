data "aws_iam_policy_document" "this" {
  count = var.policy_enable ? 1 : 0

  dynamic "statement" {
    for_each = var.cdn_access ? ["cdn"] : []
    content {
      actions   = ["s3:GetObject"]
      resources = ["${aws_s3_bucket.this.arn}/*"]

      principals {
        type        = "AWS"
        identifiers = [var.cdn_oai_iam_arn]
      }
    }
  }

  dynamic "statement" {
    for_each = var.cdn_access ? ["cdn"] : []
    content {
      actions   = ["s3:ListBucket"]
      resources = [aws_s3_bucket.this.arn]

      principals {
        type        = "AWS"
        identifiers = [var.cdn_oai_iam_arn]
      }
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.policy_enable ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this[0].json
}
