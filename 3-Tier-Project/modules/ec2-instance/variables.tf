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


variable "SG_ID" {
  description = "SG ID for EC2 Instance."
  type = string
}

variable "Subnet_ID" {
  description = "Subnet ID for EC2"
  type = string
}
