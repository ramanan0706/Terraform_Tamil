output "module_public_ip" {
  value = aws_instance.my-ec2-vm.public_ip
}