# Create EC2 Instance
resource "aws_instance" "web" {
  ami = "ami-074dc0a6f6c764218" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "web-5"
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,instance_type
    ]
  }
}
