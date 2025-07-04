#Notes
#Will need to edit most sections as appropriate


project         = "secureteam"
environment     = "dev"

aws_region      = "eu-west-2"
aws_profile     = "default"

bastion_ami_id        = "ami-0abcdef1234567890"
bastion_instance_type = "t3.micro"
key_name              = "my-ssh-key"
allowed_ssh_cidrs     = ["YOUR_IP/32"]


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
