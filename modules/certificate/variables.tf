variable "domain_name" {
  description = "Cert domain name"
  type        = string
}

variable "validation_method" {
  description = "Cert validation method"
  type        = string
  default     = "DNS"
}

variable "zone_id" {
  description = "Route53 Zone ID"
  type        = string
  default     = null
}
