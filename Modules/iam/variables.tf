variable "users" {
  description = "List of IAM user names to create"
  type        = list(string)
}

variable "default_policy_arn" {
  description = "Managed policy to attach to users (e.g., ReadOnlyAccess)"
  type        = string
  default     = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

variable "tags" {
  description = "Tags to apply to IAM users"
  type        = map(string)
  default     = {}
}
