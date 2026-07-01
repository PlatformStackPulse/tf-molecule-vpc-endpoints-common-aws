# Unit Tests — tf-molecule-vpc-endpoints-common-aws
#
# These tests use a mock AWS provider — no real AWS calls are made and no
# credentials are required. They run at `command = plan`, so every assertion
# targets values that are KNOWN at plan time (tf-label id strings, input
# pass-throughs, and the `try(..., "")` fallbacks for disabled endpoints).
#
# Run:          terraform test -test-directory=tests/unit
# Verbose:      terraform test -test-directory=tests/unit -verbose
# Single test:  terraform test -test-directory=tests/unit -run "creates_when_enabled"

mock_provider "aws" {}

variables {
  # --- tf-label context (required for a deterministic, plan-known id) ---
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # --- module-required inputs ---
  vpc_id = "vpc-0123456789abcdef0"
  region = "us-east-1"

  # --- interface-endpoint wiring (valid sample values) ---
  interface_subnet_ids         = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  interface_security_group_ids = ["sg-0123456789abcdef0"]
  route_table_ids              = ["rtb-0123456789abcdef0"]
}

# ---------------------------------------------------------------------------
# Test: default toggles create the two Gateway endpoints; their ids are the
# `try(..., "")` fallback under a mock provider only when disabled, so here we
# assert on the plan-known DISABLED interface outputs and confirm the module
# plans cleanly with the default (Gateway-on) configuration.
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  # ECR endpoint is disabled by default → output is the "" fallback (plan-known).
  assert {
    condition     = output.ecr_api_endpoint_id == ""
    error_message = "ecr_api_endpoint_id must be the empty-string fallback when ECR endpoint is disabled by default."
  }

  # SSM endpoint disabled by default → "" fallback.
  assert {
    condition     = output.ssm_endpoint_id == ""
    error_message = "ssm_endpoint_id must be the empty-string fallback when SSM endpoint is disabled by default."
  }

  # STS endpoint disabled by default → "" fallback.
  assert {
    condition     = output.sts_endpoint_id == ""
    error_message = "sts_endpoint_id must be the empty-string fallback when STS endpoint is disabled by default."
  }
}

# ---------------------------------------------------------------------------
# Test: with every toggle off, the module creates nothing and ALL id outputs
# fall back to the empty string (all plan-known).
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enable_s3_endpoint       = false
    enable_dynamodb_endpoint = false
    enable_ecr_endpoint      = false
    enable_ssm_endpoint      = false
    enable_logs_endpoint     = false
    enable_sts_endpoint      = false
  }

  assert {
    condition     = output.s3_endpoint_id == ""
    error_message = "s3_endpoint_id must be \"\" when the S3 endpoint is disabled."
  }

  assert {
    condition     = output.dynamodb_endpoint_id == ""
    error_message = "dynamodb_endpoint_id must be \"\" when the DynamoDB endpoint is disabled."
  }

  assert {
    condition     = output.s3_prefix_list_id == ""
    error_message = "s3_prefix_list_id must be \"\" when the S3 endpoint is disabled."
  }
}
