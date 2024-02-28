variable "Sg_ID" {
  description = "SG ID for app lb."
  type = string
}

variable "Subnet_ID" {
  description = "subnet ID for app lb"
  type = string
}


variable "VPC_ID" {
  description = "VPC ID for app lb"
  type = string
}


variable "tar-id-instance-alb" {
  description = "Target ID for all instance"
  type = list(string)
}
