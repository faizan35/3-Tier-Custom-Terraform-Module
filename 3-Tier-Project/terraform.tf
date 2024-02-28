terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }

  backend "s3" {
    bucket = "hulk-state-bucket"
    key = "project/terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "hulk-state-table"
  }
}

