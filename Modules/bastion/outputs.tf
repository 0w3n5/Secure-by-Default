output "bastion_public_ip" {
  value       = aws_instance.bastion.public_ip
  description = "Public IP address of the Bastion host"
}

output "bastion_id" {
  value       = aws_instance.bastion.id
  description = "ID of the Bastion EC2 instance"
}
