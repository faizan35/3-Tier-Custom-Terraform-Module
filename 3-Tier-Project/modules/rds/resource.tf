resource "aws_db_subnet_group" "rds-subnet-grp" {
  name       = "hulk-rds-subnet"
  subnet_ids = [ var.subnet_private_rds , var.subnet_private_rds-2 ]

  tags = {
    Name = "hulk-rds-subnet"
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  db_name              = "hulkdb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  vpc_security_group_ids = [ var.vpc_sg_ID_rds ]
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-grp.name

  identifier = "hulkdb"

}


