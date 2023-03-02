# Create EC2 Instance
resource "aws_instance" "web" {
  ami = "ami-0915bcb5fa77e4892" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "web-6"
  }

  lifecycle {
    ignore_changes = [
      tags,instance_type
    ]
  }
}

