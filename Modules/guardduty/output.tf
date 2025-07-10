output "guardduty_detector_id" {
  description = "GuardDuty Detector ID"
  value       = aws_guardduty_detector.this.id
}

output "guardduty_event_rule_name" {
  description = "EventBridge rule capturing GuardDuty findings"
  value       = aws_cloudwatch_event_rule.gd_finding_rule.name
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch Log Group where findings are published"
  value       = aws_cloudwatch_log_group.gd_log_group.name
}
