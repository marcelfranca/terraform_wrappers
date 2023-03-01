output "website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = aws_s3_bucket.this.website_domain
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.this.hosted_zone_id
}

output "bucket_name" {
  description = "The Name of the bucket"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_domain" {
  description = "The domain name of the bucket"
  value       = aws_s3_bucket.this.bucket_domain_name
}

output "arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.this.arn
}