resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = var.count_of_instance

  key_name = "hulk-key-pair"

  vpc_security_group_ids = [ var.SG_ID ]
  subnet_id = var.Subnet_ID

  associate_public_ip_address = true

  user_data = file("${module.ec2-instance}/script.sh")

  tags = {
    Name = "Hulk-Instance"
  }
}