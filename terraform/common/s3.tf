resource "aws_s3_bucket" "nuu_playground_s3_bucket" {
  bucket = "nuu-playground-s3-state-bucket"
  acl    = "private"
}