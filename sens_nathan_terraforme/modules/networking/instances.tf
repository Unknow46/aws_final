# Creating the instances of our architecture
resource "aws_instance" "app_instance" {
  count = var.instances_per_subnet * length(var.private_subnets_cidr)
  ami = var.aws_instance.ami
  instance_type = var.aws_instance.size
  subnet_id = aws_subnet.private[count.index % length(var.private_subnets_cidr)].id
  vpc_security_group_ids = [aws_security_group.int-webserver-sg.id]
  
  tags = {
    Name = var.aws_instance.name
  }
}