variable "ami_id" {
  description = "AMI ID for the Bastion instance (e.g., Amazon Linux 2)"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the Bastion host"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name to enable SSH access"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to deploy the Bastion host into"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Bastion host"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDRs allowed to SSH into the Bastion"
  type        = list(string)
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
