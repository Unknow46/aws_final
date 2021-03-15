output "vpc_id" {
  value = aws_vpc.com_interne.id
}

output "private_subnet_ids" {
  value = [for private_subnet in aws_subnet.private : private_subnet.id]
}

output "public_subnet_ids" {
  value = [for public_subnet in aws_subnet.public : public_subnet.id]
}

output "dns_elb" {
  value = aws_elb.lb.dns_name
}