locals {
  common_tags = {
    Owner       = "pc"
    Github      = "terraform-pc-lambda"
    Environment = var.environment
  }
  common_name          = "${local.common_tags["Owner"]}-${var.environment}-${var.region}-lambda"
  lambda_zip_path      = "${path.module}/lambda_function.zip"
  function_name        = var.function_name == "" ? local.common_name : var.function_name
  layer_name           = var.layer_name == "" ? "${local.common_name}-layer" : var.layer_name
  policy_name          = var.policy_name == "" ? "${local.common_name}-policy" : var.policy_name
  role_name            = var.role_name == "" ? "${local.common_name}-role" : var.role_name
  cloudwatch_logs_tags = merge(local.common_tags, { Name = local.function_name })
  function_tags        = merge(local.common_tags, { Name = local.function_name })
  role_tags            = merge(local.common_tags, { Name = local.role_name })
  tags                 = merge(local.common_tags, { Name = local.function_name, LayerName = local.layer_name, PolicyName = local.policy_name, RoleName = local.role_name })
}