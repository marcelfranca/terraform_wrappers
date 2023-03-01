variable "cloudfront_enabled" {
  description = "Enable/Disable Cloudfront Distribution"
  type        = string
}

variable "cloudfront_alternate_domain_name" {
  description = "Enable/Disable Cloudfront Distribution"
  type        = list(string)
}

variable "cloudfront_name" {
  description = "Cloudfront Distribution Name as Comment"
  type        = string
}

variable "default_root_object" {
  description = "Cloudfront Distribution default root object"
  type        = string
  default     = "index.html"
}

variable "origin_domain_name" {
  description = "Cloudfront Distribution Default Cache Viewer Protocol Policy"
  type        = string
}

variable "origin_id" {
  description = "Cloudfront Distribution Default Cache Min TTL"
  type        = string
}

variable "origin_path" {
  description = "Cloudfront Distribution Default Cache Min TTL"
  type        = string
  default     = null
}

variable "dcache_allowed_methods" {
  description = "Cloudfront Distribution Default Cache Default TTL"
  type        = list(string)

}

variable "dcache_cached_methods" {
  description = "Cloudfront Distribution Default Cache Max TTL"
  type        = list(string)

}

variable "dcache_forwarded_values_query_string" {
  description = "Cloudfront Distribution Geo Restriction Type"
  type        = string
  default     = true
}

variable "dcache_forwarded_headers" {
  description = "Cloudfront Distribution Geo Restriction Locations"
  type        = list(string)
  default     = null
}

variable "dcache_forwarded_values_cookies_forward" {
  description = "Cloudfront Distribution Cost Center Tag"
  type        = string
  default     = "none"
}

variable "dcache_viewer_protocol_policy" {
  description = "Protocol that users can use to access the files in the origin"
  type        = string
}

variable "dcache_min_ttl" {
  description = "The minimum amount of time that you want objects to stay in CloudFront caches"
  type        = string
}

variable "dcache_default_ttl" {
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache"
  type        = string
}

variable "dcache_max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache"
  type        = string
}

variable "error_pages" {
  description = "Map to contain response for several errors"
  type        = map(any)
  default     = {}
}

variable "ordered_cache_behavior" {
  description = "Handle ordered caching"
  type        = any
  default     = []
}

variable "cloudfront_default_certificate" {
  description = "Enable/Disable CDN certificate"
  type        = bool
  default     = false
}

variable "cloudfront_custom_viewer_certificate" {
  description = "ACM viewer certificate"
  type        = string
}

variable "cloudfront_custom_viewer_ssl_method" {
  description = "SSL support method"
  type        = string
}


variable "cloudfront_minimum_protocol_version" {
  description = "Minimum protocol version for the viewer"
  type        = string
}

data "aws_region" "this" {}
