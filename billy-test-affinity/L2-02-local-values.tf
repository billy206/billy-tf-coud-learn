# Define Local Values in Terraform
locals {
  owners      = var.product_name
  environment = var.environment
  name        = "${local.owners}-${var.environment}"
}
