resource "aws_s3_bucket" "state-backend" {
  bucket = "hulk-state-bucket"

  tags = {
    Name        = "hulk-state-bucket"
  }
}


resource "aws_dynamodb_table" "backend-table" {
  name             = "hulk-state-table"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "hulk-state-table"
  }

}