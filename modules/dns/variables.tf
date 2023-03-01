variable "zone_name" {
  description = "Route53 Zone Name"
  type        = string
  default     = null
}

variable "zone_id" {
  description = "Route53 Zone ID"
  type        = string
  default     = null
}

variable "private_zone" {
  description = "Route53 Zone Private/Public"
  type        = bool
  default     = false
}

variable "records" {
  description = "List of maps of DNS records"
  type        = any
  default     = [""]
}
