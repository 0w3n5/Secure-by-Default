variable "enable_guardduty" {
  description = "Enable or disable GuardDuty"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for GuardDuty detector"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}
