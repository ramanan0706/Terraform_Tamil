resource "aws_security_group" "sg_label_01" {
  name = "terra-sg"
  description = "test"
  vpc_id = "vpc-0dda100268be3bfdd"
  ingress{
        description = "terra"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0","0.0.0.0/8"]
        
  }
  ingress{
        description = "terra-second"
        from_port = 100
        to_port = 200
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
        
  }


  tags = {
    "app_id" = "12246566"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10
  tags = {
    Name = "HelloWorld"
  }
}