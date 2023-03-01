variable "bucket_name" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "bucket_tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "versioning_enable" {
  description = "Enable/Disable Bucket Versioning."
  type        = bool
  default     = false
}

variable "lifecycle_rule" {
  description = "List of bucket lifecycle rules"
  type        = list(any)
  default     = []
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = false
}

variable "cors_rule" {
  description = "List of maps containing rules for Cross-Origin Resource Sharing."
  type        = list(any)
  default     = []
}

variable "website" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = map(string)
  default     = {}
}

######################################### IAM Related ############################################
variable "policy_enable" {
  description = "Enable/Disable bucket policy."
  type        = bool
  default     = true
}

variable "cdn_access" {
  description = "Enable/Disable cdn access."
  type        = bool
  default     = true
}

variable "cdn_oai_iam_arn" {
  description = "CDN origin access identity IAM arn"
  type        = string
  default     = ""
}

variable "default_encryption" {
  description = "Enable/Disable S3 objects default encryption."
  type        = bool
  default     = true
}

######################################### Data & Locals #########################################
locals {
  account_id = data.aws_caller_identity.this.account_id
  region     = data.aws_region.this.name

}

data "aws_caller_identity" "this" {}
data "aws_region" "this" {}
