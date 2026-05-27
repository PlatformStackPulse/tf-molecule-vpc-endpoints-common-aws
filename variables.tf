# -----------------------------------------------------------------------------
# Module-Specific Variables
# -----------------------------------------------------------------------------

variable "vpc_id" {
  type        = string
  description = "The VPC ID to create endpoints in."
}

variable "region" {
  type        = string
  description = "AWS region for service name construction."
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs for Gateway endpoints (S3, DynamoDB)."
  default     = []
}

variable "interface_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Interface endpoints."
  default     = []
}

variable "interface_security_group_ids" {
  type        = list(string)
  description = "Security group IDs for Interface endpoints."
  default     = []
}

# --- Endpoint toggles ---
variable "enable_s3_endpoint" {
  type        = bool
  description = "Enable S3 Gateway endpoint."
  default     = true
}

variable "enable_dynamodb_endpoint" {
  type        = bool
  description = "Enable DynamoDB Gateway endpoint."
  default     = true
}

variable "enable_ecr_endpoint" {
  type        = bool
  description = "Enable ECR (API + DKR) Interface endpoints."
  default     = false
}

variable "enable_ssm_endpoint" {
  type        = bool
  description = "Enable SSM + SSM Messages Interface endpoints."
  default     = false
}

variable "enable_logs_endpoint" {
  type        = bool
  description = "Enable CloudWatch Logs Interface endpoint."
  default     = false
}

variable "enable_sts_endpoint" {
  type        = bool
  description = "Enable STS Interface endpoint."
  default     = false
}
