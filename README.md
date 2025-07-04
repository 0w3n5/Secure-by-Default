# --- README.md ---

# Secure by Default – Terraform Blueprint for Small Teams
### In Production!!! Below is the plan for this repo###

This is a modular Terraform blueprint to deploy a secure-by-default AWS environment suitable for small teams and prototyping with good security posture.

## 🔐 Key Features
- ✅ Secure VPC with DNS support
- ✅ Bastion host with public IP & SSH access
- ✅ S3 bucket with encryption, versioning, and blocked public access
- ✅ IAM users with ReadOnlyAccess policy and enforced password reset
- ✅ AWS GuardDuty threat detection enabled

## 📁 Project Structure
```
.
├── main.tf               # Root config wiring all modules
├── variables.tf          # Root-level input variables
├── terraform.tfvars      # Default values for easier deployment
├── modules/
│   ├── vpc/              # Secure VPC module
│   ├── bastion/          # Bastion EC2 instance + SG
│   ├── s3/               # Secure bucket with encryption
│   ├── iam/              # Least-privilege IAM users
│   └── guardduty/        # GuardDuty detector
```

## ⚙️ Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/install) v1.5+
- AWS CLI authenticated with a profile (or use environment variables)

## 🚀 Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/your-org/secure-terraform-blueprint.git
   cd secure-terraform-blueprint
   ```

2. Customize `terraform.tfvars` as needed:
   ```hcl
   project         = "secureteam"
   environment     = "dev"
   bastion_key_name = "my-key"
   ami_id           = "ami-0abcdef1234567890"
   iam_users        = ["alice", "bob"]
   ```

3. Initialize and apply:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## 🧹 Cleanup
```bash
terraform destroy
```

## 🛡 Recommendations
- Use S3 + DynamoDB backend for remote state (not included)
- Use KMS CMKs for advanced encryption
- Rotate IAM credentials regularly

## 🧱 Extend With
- CloudTrail logging
- CloudWatch alarms
- VPC flow logs
- WAF for APIs

## 👨‍👩‍👧‍👦 Authors
Created by Owen Sweet
