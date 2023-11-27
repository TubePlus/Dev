resource "aws_s3_bucket" "tubeplus-s3-tf-state" {

  bucket = "<tubeplus Name>-s3-tf-state"

  tags = {
    "Name" = "<tubeplus Name>-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "tubeplus-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.tubeplus-s3-tf-state]
  name         = "<tubeplus Name>-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "<tubeplus Name>-ddb-tf-lock"
  }

}