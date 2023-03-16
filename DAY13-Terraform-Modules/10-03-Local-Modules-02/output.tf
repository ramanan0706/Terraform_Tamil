output "public_ip"{
    value = module.ec2_instnaces.module_public_ip
}

output "ami_id" {
  value = module.ec2_instnaces.ami_id
}