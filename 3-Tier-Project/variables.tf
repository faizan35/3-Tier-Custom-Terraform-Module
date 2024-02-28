variable "cidr_vpc" {
  description = "CIDR for VPC."
  type = string
}

variable "public_cidr_vpc" {
  description = "public CIDR for VPC."
  type = string
}


variable "private_cidr_vpc" {
  description = "Private CIDR for VPC."
  type = string
}

############################################
variable "private_cidr_vpc-2" {
  description = "Private CIDR for VPC."
  type = string
}
##############################################

####### EC2 ########

variable "ami" {
  description = "AMI for EC2"
  type = string
}

variable "instance_type" {
  description = "Type of Instance"
  type = string
}

variable "count_of_instance" {
  description = "number of instance"
  type = number
}


