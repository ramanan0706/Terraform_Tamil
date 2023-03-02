
# Create EC2 Instance
resource "aws_instance" "web" {
  ami = "ami-074dc0a6f6c764218" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "web-4"
  }

  lifecycle {
    replace_triggered_by = [
      aws_s3_bucket.b.id
    ]
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-157673692367"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}