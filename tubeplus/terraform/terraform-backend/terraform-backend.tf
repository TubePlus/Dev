resource "aws_s3_bucket" "tubeplus-s3-tf-state" {

  bucket = "tubeplus-s3-tf-state"

  tags = {
    "Name" = "tubeplus-s3-tf-state"
  }
  
}

# resource "aws_dynamodb_table" "tubeplus-ddb-lock-table" {

#   depends_on   = [aws_s3_bucket.tubeplus-s3-tf-state]
#   name         = "tubeplus-ddb-lock-table"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     "Name" = "tubeplus-ddb-lock-table"
#   }

# }