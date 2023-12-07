output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "mgmt_subnet_id" {
  value = aws_subnet.mgmt_subnet.id
}

output "inside_subnet_id" {
  value = aws_subnet.inside_subnet.id
}