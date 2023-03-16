
locals {
  ports = {
            80 = ["0.0.0.0/0"]
            443 = ["10.0.0.0/16"]
            8080 = ["10.10.0.0/24"]
            8081 = ["0.0.0.0/0"]
            7080 = ["0.0.0.0/0"]
          }

    to_port_mapping = {
    80 = 90
    443 = 450
    8080 = 8080
    8081 = 8090
    7080 = 7090
}
}



resource "aws_security_group" "dynamic_testing" {
  name = "dynna-sg"
  description = "dynamic block is used"

  dynamic "ingress" {
    for_each = local.ports
    content {
        description = "description ${ingress.key}"
        from_port   = ingress.key
        to_port     = lookup(local.to_port_mapping,ingress.key)
        protocol    = "tcp"
        cidr_blocks = ingress.value
    }
  }
}