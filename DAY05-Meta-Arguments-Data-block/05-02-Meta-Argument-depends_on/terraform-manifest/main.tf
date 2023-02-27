resource "aws_s3_bucket" "b1" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "b2" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "qa"
  }
  depends_on = [
    aws_s3_bucket.b1
  ]
}