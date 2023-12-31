# AWS ELB
resource "aws_elb" "elb" {
  count = var.high_availability == false ? 0 : 1
  name    = "my-elb"
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  instances                   = aws_instance.my-ec2-vm[*].id

  availability_zones = var.availability_zones

}

