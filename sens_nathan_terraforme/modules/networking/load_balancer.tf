


# Creating the Elastic Load Balancer of our architecture
resource "aws_elb" "lb" {
  name = "ELB"
  subnets = aws_subnet.public.*.id
  security_groups = [aws_security_group.int-lb-sg.id]
  health_check {
    healthy_threshold = 2
    interval = 30
    target = "HTTP:80/"
    timeout = 3
    unhealthy_threshold = 2
  }
  
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  tags = {
    Name = "classic ELB"
  }
  
}

# Attaching each of our instances to our ELB
resource "aws_elb_attachment" "instances_in_elb" {
  count = length(aws_instance.app_instance)
  elb = aws_elb.lb.id
  instance = aws_instance.app_instance[count.index].id
}