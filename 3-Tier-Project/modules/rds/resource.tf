# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [var.subnet_private_rds]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  db_name              = "hulkdb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "root"
  password             = "root12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  vpc_security_group_ids = [ var.vpc_sg_ID_rds ]
  db_subnet_group_name = var.subnet_private_rds


}


