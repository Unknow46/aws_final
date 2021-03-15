# Security group of the ELB
resource "aws_security_group" "int-lb-sg" {
  depends_on = [aws_security_group.int-webserver-sg]
  name = "elb_http"
  description = "Allow HTTP traffic to instances through ELB"
  vpc_id = aws_vpc.com_interne.id
  
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "int-lb-sg"
  }
}

# Security rule of the ELB
resource "aws_security_group_rule" "rule_lb-sg" {
  from_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.int-lb-sg.id
  to_port = 80
  type = "egress"
  source_security_group_id = aws_security_group.int-webserver-sg.id
}

# Security group of the instances
resource "aws_security_group" "int-webserver-sg" {
  name = "security webserver"
  vpc_id = aws_vpc.com_interne.id
  
  egress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "int-webserver-sg"
  }
  
}

# Security rules of the instances
resource "aws_security_group_rule" "rule_webserver-sg" {
  from_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.int-webserver-sg.id
  to_port = 80
  type = "ingress"
  source_security_group_id = aws_security_group.int-lb-sg.id
}