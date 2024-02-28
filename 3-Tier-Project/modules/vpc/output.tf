output "vpc_id" {
  value = aws_vpc.hulk-vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public-hulk-subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private-hulk-subnet.id
}


output "private_subnet_id-2" {
  value = aws_subnet.private-hulk-subnet-2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
