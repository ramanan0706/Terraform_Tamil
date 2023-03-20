locals {
  ingress_value = {
            443 = [500, "0.0.0.0/16"]
            8080 = [8084, "0.0.0.0/16"]
            8081 = [8088, "192.0.0.0/8"]
            900  = [1000, "10.2.0.0/24"]
        }
    
#   cidr_blocks = {
#             443 = ["0.0.0.0/16"]
#             8080 = ["10.0.0.0/16"]
#             8081 = ["192.0.0.0/8"]
#             900  = ["10.2.0.0/24"]
#             }
}

resource "aws_security_group" "dynamic_testing" {
  name = "dynna-sg"
  description = "dynamic block is used"

  dynamic "ingress" {
    for_each = local.ingress_value
    content {
        description = "description"
        from_port   = ingress.key
        to_port   =  ingress.value[0]
        protocol    = "tcp"
        cidr_blocks = [ingress.value[1]]
    }
  }

  
}


