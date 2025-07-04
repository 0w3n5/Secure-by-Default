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

variable "bastion_ami_id" {
  description = "AMI ID for the Bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "EC2 instance type for the Bastion"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDRs allowed to SSH into Bastion"
  type        = list(string)
}

variable "iam_users" {
  description = "
