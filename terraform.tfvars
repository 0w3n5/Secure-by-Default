#Notes
#


project         = "secureteam"
environment     = "dev"

aws_region      = "eu-west-2"
aws_profile     = "default"

bastion_key_name = "my-ec2-keypair"
ami_id           = "ami-0abcdef1234567890" # Replace with your actual AMI ID

iam_users = [
  "alice",
  "bob"
]

tags = {
  Owner       = "YourName"
  Project     = "SecureTeam"
  Environment = "dev"
  ManagedBy   = "Terraform"
}
