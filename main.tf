# -----------------------------------------------------
# Molecule: VPC Endpoints Common
# Creates standard VPC endpoints for private connectivity.
# Supports both Gateway (S3, DynamoDB) and Interface endpoints.
# -----------------------------------------------------

# --- Gateway Endpoint: S3 ---
module "s3_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_s3_endpoint ? 1 : 0

  context           = module.this.context
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids
}

# --- Gateway Endpoint: DynamoDB ---
module "dynamodb_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_dynamodb_endpoint ? 1 : 0

  context           = module.this.context
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids
}

# --- Interface Endpoint: ECR API ---
module "ecr_api_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_ecr_endpoint ? 1 : 0

  context             = module.this.context
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.interface_security_group_ids
  subnet_ids          = var.interface_subnet_ids
}

# --- Interface Endpoint: ECR DKR ---
module "ecr_dkr_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_ecr_endpoint ? 1 : 0

  context             = module.this.context
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.interface_security_group_ids
  subnet_ids          = var.interface_subnet_ids
}

# --- Interface Endpoint: SSM ---
module "ssm_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_ssm_endpoint ? 1 : 0

  context             = module.this.context
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.interface_security_group_ids
  subnet_ids          = var.interface_subnet_ids
}

# --- Interface Endpoint: SSM Messages ---
module "ssm_messages_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_ssm_endpoint ? 1 : 0

  context             = module.this.context
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.interface_security_group_ids
  subnet_ids          = var.interface_subnet_ids
}

# --- Interface Endpoint: CloudWatch Logs ---
module "logs_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_logs_endpoint ? 1 : 0

  context             = module.this.context
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.interface_security_group_ids
  subnet_ids          = var.interface_subnet_ids
}

# --- Interface Endpoint: STS ---
module "sts_endpoint" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-vpc-endpoint-aws.git?ref=v1.1.0"

  count = var.enable_sts_endpoint ? 1 : 0

  context             = module.this.context
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.sts"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.interface_security_group_ids
  subnet_ids          = var.interface_subnet_ids
}
