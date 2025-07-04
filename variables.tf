#Notes
# Replace ami-0abcdef1234567890 with a valid AMI for your region (Amazon Linux 2 or Ubuntu).
# bastion_key_name must match a key you’ve uploaded in EC2 → Key Pairs.
# iam_users can expanded as needed

variable "project" {
  description = "Project name prefix used in resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)"
  type        = string
}

variable "tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "bastion_key_name" {
  description = "Name of the SSH key pair for accessing the Bastion host"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for Bastion host EC2 instance"
  type        = string
}

variable "iam_users" {
  description = "
