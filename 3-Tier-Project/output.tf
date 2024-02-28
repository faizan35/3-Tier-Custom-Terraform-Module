############# VPC ###########
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "internet_gateway" {
  value = module.vpc.internet_gateway_id
}

##################################


############ SG #################

output "SG_ID" {
  value = module.sg.SG_ID
}


############## EC2 ############
output "instance-ID" {
  value = module.ec2-instance.instance-ID
}