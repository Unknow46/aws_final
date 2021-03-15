# Internet GW for our VPC
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.com_interne.id
  tags = {
    Name = "VPC Internet Gateway"
  }
}

# Creating an Elastic IP for the NAT Gateway
resource "aws_eip" "nat-gateway-eip" {
  count = length(var.public_subnets_cidr)
  vpc = true
}

# Associating the NAT gateway to the public subnet
resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.public_subnets_cidr)
  allocation_id = aws_eip.nat-gateway-eip[count.index].id
  subnet_id = aws_subnet.public[count.index].id
  
  tags = {
    Name = "Nat-Gateway"
  }
  
}