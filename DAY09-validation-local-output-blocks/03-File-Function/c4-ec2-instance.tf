locals {
   appid = "${var.company_name}-${var.project_name}-${var.team_name}-${var.team_number}"
}


# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami           = var.ec2_ami_id 
  instance_type = var.ec2_instance_type
  key_name      = "ec2_key_pair"
	user_data = file("apache-install.sh")  

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "web"
     "app_id" = "${local.appid}-instance-abcd"
  }
}






output "public_ip" {
  value = aws_instance.my-ec2-vm.public_ip
}

output "Instance_id" {
  value = aws_instance.my-ec2-vm.arn
}