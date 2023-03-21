# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
  key_name      = "ec2_private_key"  
	user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-dev-null-res-asdfasdf"
  }

}

resource "time_sleep" "test-terra" {
  depends_on = [
    null_resource.terra
  ]
  create_duration = "30s"
}

resource "null_resource" "terra" {
    connection {
    type = "ssh"
    host = "13.234.78.209"  
    user = "ec2-user"
    password = ""
    private_key = file("private-key/ec2_private_key.pem")
  }

  provisioner "remote-exec" {
    script = "scripts/test.sh"
  }

  triggers = {
    always_trigger = timestamp()
  }
}


resource "aws_sns_topic" "sns" {
    depends_on = [
    time_sleep.test-terra
  ]
  display_name = "test-sns"
}