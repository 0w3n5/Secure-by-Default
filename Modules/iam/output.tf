output "user_names" {
  description = "The names of the IAM users created"
  value       = [for user in aws_iam_user.users : user.name]
}

output "access_keys" {
  description = "Access keys for IAM users (use securely!)"
  sensitive   = true
  value = {
    for user, ak in aws_iam_access_key.access_keys :
    user => {
      access_key_id     = ak.id
      secret_access_key = ak.secret
    }
  }
}
