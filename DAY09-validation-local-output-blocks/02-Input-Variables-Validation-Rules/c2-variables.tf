# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0915bcb5fa77e4892" # Amazon2 Linux AMI ID
  validation {
    condition = length(var.ec2_ami_id) > 4 || substr(var.ec2_ami_id, 0,4) == "ami-"
    error_message = "The AMI ID should be more than 4 characters"
  }
  
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type = string
  validation {
    condition = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t2.nano" || var.ec2_instance_type == "t3.micro"
    error_message = "It should be either t2.micro or t2.nano or t3.micro"
  }
}