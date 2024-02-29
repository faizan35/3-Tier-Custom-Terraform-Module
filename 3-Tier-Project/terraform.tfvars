#### VPC ####

cidr_vpc = "20.0.0.0/16"
public_cidr_vpc = "20.0.1.0/24"
private_cidr_vpc = "20.0.2.0/24"
private_cidr_vpc-2 = "20.0.3.0/24"


###### EC2 ##########

ami = "ami-0ce2cb35386fc22e9"
instance_type = "t2.micro"
count_of_instance = 2


####### RDS #########

instance_class = "db.t2.micro"
username = "root"
password = "root12345"
allocated_storage = 10