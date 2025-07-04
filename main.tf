#Notes
#Replace "10.0.0.0/16" with your actual VPC CIDR if needed.
#Remote backend section is commented but ready to go if you want state locking.
#It is assumed that your variables.tf includes aws_region, aws_profile, project, environment, etc.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional: configure backend if using remote state
  # backend "s3" {
  #   bucket         = "my-secure-terraform-state"
  #   key            = "env/dev/terraform.tfstate"
  #   region         = "eu-west-2"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "10.0.0.0/16"
  environment = var.environment
  tags        = var.tags
}

module "bastion" {
  source           = "./modules/bastion"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.public_subnet_id
  key_name         = var.bastion_key_name
  ami_id           = var.bastion_ami_id
  instance_type    = var.bastion_instance_type
  allowed_ssh_cidrs = var.allowed_ssh_cidrs
  environment      = var.environment
  tags             = var.tags
}

module "s3_secure" {
  source      = "./modules/s3"
  bucket_name = "${var.project}-secure-data-${var.environment}"
  tags        = var.tags
}


module "iam" {
  source            = "./modules/iam"
  users             = var.iam_users
  default_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  tags              = var.tags
}


module "guardduty" {
  source            = "./modules/guardduty"
  enable_guardduty  = true
  environment       = var.environment
  tags              = var.tags
}

