resource "aws_instance" "vm-01" {
  ami = "ami-0dfcb1ef8550277af"
  associate_public_ip_address = true
  availability_zone = "us-east-1e"
  instance_type = "t2.micro"
  subnet_id = "subnet-0d260ebfe3ece0ded"
  vpc_security_group_ids = [aws_security_group.sg_label_01.id]
  key_name = "ec2_key_pair"
  root_block_device{
    volume_size = 20
    volume_type = "standard"
    delete_on_termination = true
  }
}