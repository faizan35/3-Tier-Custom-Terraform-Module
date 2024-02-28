resource "aws_s3_bucket" "state-backend" {
  bucket = "hulk-state-bucket"

  tags = {
    Name        = "hulk-state-bucket"
  }
}


resource "aws_dynamodb_table" "backend-table" {
  name             = "tarra-state-table"
  hash_key         = "LockingID"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "LockingID"
    type = "S"
  }

  tags = {
    Name = "hulk-state-table"
  }


}