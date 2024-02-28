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

# variable "vpc_id" {
#   description = "VPC ID for SG"
#   type = string
# }