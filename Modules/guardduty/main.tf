resource "aws_guardduty_detector" "this" {
  enable = var.enable_guardduty

  tags = merge(var.tags, {
    "Name" = "guardduty-${var.environment}"
  })
}

# Create CloudWatch Log Group for findings
resource "aws_cloudwatch_log_group" "gd_log_group" {
  name              = "/aws/guardduty/findings"
  retention_in_days = 30
}

# IAM Role for EventBridge to publish to CloudWatch
resource "aws_iam_role" "eventbridge_to_logs" {
  name = "gd-eventbridge-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "events.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "eventbridge_policy" {
  name = "gd-eventbridge-logs-policy"
  role = aws_iam_role.eventbridge_to_logs.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["logs:PutLogEvents", "logs:CreateLogStream"],
        Resource = "${aws_cloudwatch_log_group.gd_log_group.arn}:*"
      }
    ]
  })
}

# EventBridge Rule for GuardDuty Findings
resource "aws_cloudwatch_event_rule" "gd_finding_rule" {
  name        = "guardduty-finding-rule"
  description = "Matches GuardDuty findings and sends to CloudWatch"
  event_pattern = jsonencode({
    source = ["aws.guardduty"],
    detail-type = ["GuardDuty Finding"]
  })
}

# EventBridge Target (CloudWatch Logs)
resource "aws_cloudwatch_event_target" "gd_logs_target" {
  rule      = aws_cloudwatch_event_rule.gd_finding_rule.name
  arn       = aws_cloudwatch_log_group.gd_log_group.arn
  role_arn  = aws_iam_role.eventbridge_to_logs.arn
}

#to send it to email
resource "aws_cloudwatch_event_target" "gd_sns_target" {
  rule      = aws_cloudwatch_event_rule.gd_finding_rule.name
  arn       = aws_sns_topic.gd_alerts.arn
}

# SNS Topic for GuardDuty Alerts
resource "aws_sns_topic" "gd_alerts" {
  name = "guardduty-alerts"
}

# SNS Email Subscription
resource "aws_sns_topic_subscription" "gd_email" {
  topic_arn = aws_sns_topic.gd_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email_address
}

