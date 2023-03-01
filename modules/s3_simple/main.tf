locals {
  buckets_map = { for bucket, att in var.buckets : att.name => att }
}

resource "aws_s3_bucket" "bucket" {
  for_each = local.buckets_map
  bucket   = each.value.name
  acl      = each.value.acl
  versioning {
    enabled = each.value.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  for_each                = local.buckets_map
  bucket                  = each.value.name
  block_public_acls       = each.value.block_public_acl
  block_public_policy     = each.value.block_public_policy
  ignore_public_acls      = each.value.ignore_public_acls
  restrict_public_buckets = each.value.restrict_public_buckets
}
