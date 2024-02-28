output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public-hulk-subnet.id
}

output "private_subnet_id" {
  value = module.vpc.private-hulk-subnet.id
}

output "internet_gateway" {
  value = module.vpc.igw.id
}