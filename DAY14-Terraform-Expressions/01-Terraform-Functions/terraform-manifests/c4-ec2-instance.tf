
locals {
  instance_type = lookup(
                          {
                          app = "t2.micro"
                          web = "t3.micro"
                          db  = "t2.large"
                          },

                          var.app_type,

                          "t2.medium"
                        )
}

# Create EC2 Instance - Amazon2 Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = local.instance_type
  key_name      = "terraform-key"
  user_data = templatefile("install_application.tmpl", 
                            { 
                                package_name = var.package_name , 
                                package_name2 = "git",
                                name = "sur"
                            }
                          )  


  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "TF-Functions-Demo-1"
  }
}














