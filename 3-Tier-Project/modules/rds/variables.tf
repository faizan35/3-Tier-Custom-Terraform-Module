variable "vpc_sg_ID_rds" {
  description = "vpc sg ID for RDS"
  type = string
}

variable "subnet_private_rds" {
  description = "Private Subnet for RDS."
  type = string
}

variable "subnet_private_rds-2" {
  description = "Private Subnet for RDS."
  type = string
}


variable "instance_class" {
  description = "Class Of Instance"
  type = string
}

variable "username" {
  description = "DB Username"
  type = string
}


variable "password" {
  description = "DB Password"
  type = string
}


variable "allocated_storage" {
  description = "DB Storage"
  type = number
}

