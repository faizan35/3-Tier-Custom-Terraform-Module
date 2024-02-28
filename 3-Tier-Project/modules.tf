module "vpc" {
  source = "./modules/vpc"
  cidr_vpc = var.cidr_vpc
  public_cidr_vpc = var.public_cidr_vpc
  private_cidr_vpc = var.private_cidr_vpc
}


module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}


module "ec2-instance" {
  source = "./modules/ec2-instance"
  ami = var.ami
  instance_type = var.instance_type
  count_of_instance = var.count_of_instance
  SG_ID = module.sg.SG_ID
  Subnet_ID = module.vpc.public_subnet_id
}