

# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {  

  count = var.high_availability == true ? 2 : 1

  ami           = data.aws_ami.amzlinux.id
  instance_type = var.instance_type
  #key_name      = "terraform-key"
	user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]


  availability_zone = var.availability_zones[count.index]
}


