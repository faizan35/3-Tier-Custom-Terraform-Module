module "vpc" {
  source = "./modules/vpc"
  cidr_vpc = var.cidr_vpc
  public_cidr_vpc = var.public_cidr_vpc
  private_cidr_vpc = var.private_cidr_vpc
  private_cidr_vpc-2 = var.private_cidr_vpc-2
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

module "app_lb" {
  source = "./modules/app-lb"
  Sg_ID = module.sg.SG_ID
  Subnet_ID = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
  VPC_ID = module.vpc.vpc_id
  tar-id-instance-alb = module.ec2-instance.instance-ID
}

module "rds" {
  source = "./modules/rds"
  vpc_sg_ID_rds = module.sg.SG_ID
  subnet_private_rds = module.vpc.private_subnet_id
  subnet_private_rds-2 = module.vpc.private_subnet_id-2
}
