output "dns" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "zone_id" {
  value = aws_cloudfront_distribution.this.hosted_zone_id
}

output "oai_iam_arn" {
  value = aws_cloudfront_origin_access_identity.this.iam_arn
}
