resource "aws_cloudfront_distribution" "this" {
  enabled = var.cloudfront_enabled
  aliases = var.cloudfront_alternate_domain_name

  comment = var.cloudfront_name

  default_root_object = var.default_root_object

  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.origin_id

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.this.id}"
    }
  }

  default_cache_behavior {
    allowed_methods  = var.dcache_allowed_methods
    cached_methods   = var.dcache_cached_methods
    target_origin_id = var.origin_id

    forwarded_values {
      query_string = var.dcache_forwarded_values_query_string
      headers      = var.dcache_forwarded_headers

      cookies {
        forward = var.dcache_forwarded_values_cookies_forward
      }
    }

    viewer_protocol_policy = var.dcache_viewer_protocol_policy
    min_ttl                = var.dcache_min_ttl
    default_ttl            = var.dcache_default_ttl
    max_ttl                = var.dcache_max_ttl
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behavior
    iterator = ob

    content {
      path_pattern     = lookup(ob.value, "path_pattern", null)
      allowed_methods  = lookup(ob.value, "allowed_methods", var.dcache_allowed_methods)
      cached_methods   = lookup(ob.value, "cached_methods", var.dcache_cached_methods)
      target_origin_id = lookup(ob.value, "target_origin_id", var.origin_id)
      cache_policy_id  = lookup(ob.value, "cache_policy_id", null)

      dynamic "forwarded_values" {
        for_each = lookup(ob.value, "forwarded_values_enable", false) ? ["fwd_values"] : []

        content {
          query_string            = lookup(ob.value, "query_string", false)
          query_string_cache_keys = lookup(ob.value, "query_string_cache_keys", [])
          headers                 = lookup(ob.value, "headers", [])

          cookies {
            forward           = lookup(ob.value, "cookies_forward", "none")
            whitelisted_names = lookup(ob.value, "cookies_whitelisted_names", null)
          }
        }
      }

      viewer_protocol_policy = lookup(ob.value, "viewer_protocol_policy", var.dcache_viewer_protocol_policy)

    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  dynamic "custom_error_response" {
    for_each = var.error_pages

    content {
      error_code            = lookup(custom_error_response.value, "custom_error_response_error_code", null)
      response_code         = lookup(custom_error_response.value, "custom_error_response_code", null)
      response_page_path    = lookup(custom_error_response.value, "custom_error_response_page_path", null)
      error_caching_min_ttl = lookup(custom_error_response.value, "custom_error_caching_ttl", null)
    }
  }

  tags = {
    Name = var.cloudfront_name
  }
  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
    acm_certificate_arn            = var.cloudfront_custom_viewer_certificate
    ssl_support_method             = var.cloudfront_custom_viewer_ssl_method
    minimum_protocol_version       = var.cloudfront_minimum_protocol_version
  }
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "Access identity for static_pages_cloudfront_distribution"
}

