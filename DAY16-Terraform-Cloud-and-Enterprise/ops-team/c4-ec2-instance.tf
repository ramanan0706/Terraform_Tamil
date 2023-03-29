# Create EC2 Instance - Amazon2 Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
  count = 1
  vpc_security_group_ids = [data.terraform_remote_state.security_id_from_NW.outputs.ssh_security_id]
  tags = {
    "Name" = "Terraform-Cloud-${count.index}"
  }
}


data "terraform_remote_state" "security_id_from_NW" {
  backend = "remote"

  config = {
    organization = "skillupwithstan"
    workspaces = {
      name = "NETWORK-TEAM"
    }
  }
}
