output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "igw_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.igw.id
}
