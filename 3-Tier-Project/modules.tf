module "vpc" {
  source = "./modules/vpc"
  cidr_vpc = var.cidr_vpc
  public_cidr_vpc = var.public_cidr_vpc
  private_cidr_vpc = var.private_cidr_vpc
}