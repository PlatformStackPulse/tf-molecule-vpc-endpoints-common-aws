output "s3_endpoint_id" {
  description = "ID of the S3 Gateway endpoint."
  value       = try(module.s3_endpoint[0].id, "")
}

output "dynamodb_endpoint_id" {
  description = "ID of the DynamoDB Gateway endpoint."
  value       = try(module.dynamodb_endpoint[0].id, "")
}

output "ecr_api_endpoint_id" {
  description = "ID of the ECR API Interface endpoint."
  value       = try(module.ecr_api_endpoint[0].id, "")
}

output "ecr_dkr_endpoint_id" {
  description = "ID of the ECR DKR Interface endpoint."
  value       = try(module.ecr_dkr_endpoint[0].id, "")
}

output "ssm_endpoint_id" {
  description = "ID of the SSM Interface endpoint."
  value       = try(module.ssm_endpoint[0].id, "")
}

output "logs_endpoint_id" {
  description = "ID of the CloudWatch Logs Interface endpoint."
  value       = try(module.logs_endpoint[0].id, "")
}

output "sts_endpoint_id" {
  description = "ID of the STS Interface endpoint."
  value       = try(module.sts_endpoint[0].id, "")
}

output "s3_prefix_list_id" {
  description = "Prefix list ID of the S3 Gateway endpoint (for security groups)."
  value       = try(module.s3_endpoint[0].prefix_list_id, "")
}

output "dynamodb_prefix_list_id" {
  description = "Prefix list ID of the DynamoDB Gateway endpoint."
  value       = try(module.dynamodb_endpoint[0].prefix_list_id, "")
}
