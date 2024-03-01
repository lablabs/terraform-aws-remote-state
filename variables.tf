variable "lock" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating dynamodb table for locking"
}

variable "state" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating s3 bucket for remote state"
}

variable "state_policies" {
  type        = list(any)
  default     = []
  description = "Additional policies attached to bucket as list of aws_iam_policy_document "
}

variable "state_sse" {
  type        = string
  default     = "AES256"
  description = "Set to aws:kms to enable encryption SSE-KMS on s3 bucket for remote state"

  #  validation {
  #    condition = can(regex("^(AES256|aws:kms)$", var.state_encryption))
  #    error_message = "ERROR: Encryption must be AES256 OR aws:kms."
  #  }
}

variable "state_kms" {
  type        = string
  default     = "master"
  description = "The AWS KMS master key ARN used for the SSE-KMS encryption. This can only be used when you set the value of encryption as aws:kms. The default aws/s3 AWS KMS master key is used if this element is set to 'master' or 'auto' for auto generated kms or 'arn:'"

  #  validation {
  #    condition = can(regex("^(master|auto|arn:aws:kms:.*)$", var.state_kms))
  #    error_message = "ERROR: KMS must be master OR auto OR starts with arn:aws:kms:"
  #  }
}

variable "state_kms_policies" {
  type        = list(any)
  default     = []
  description = "Additional policies attached to kms as list of aws_iam_policy_document "
}

variable "dynamo_billing_mode" {
  type        = string
  default     = "PAY_PER_REQUEST"
  description = "DynamoDB Billing mode. Can be PROVISIONED or PAY_PER_REQUEST"
}

variable "dynamo_min_read_capacity" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling min read capacity"
}

variable "dynamo_min_write_capacity" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling min write capacity"
}

variable "allow_ssl_requests_only" {
  type        = bool
  default     = false
  description = "Set to `true` to require requests to use Secure Socket Layer (HTTPS/SSL). This will explicitly deny access to HTTP requests"
}
