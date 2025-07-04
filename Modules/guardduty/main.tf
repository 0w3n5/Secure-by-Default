resource "aws_guardduty_detector" "this" {
  enable = var.enable_guardduty

  tags = merge(var.tags, {
    "Name" = "guardduty-${var.environment}"
  })
}
