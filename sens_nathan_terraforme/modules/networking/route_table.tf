# Route table : attach internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.com_interne.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "Route Table for internet Gateway"
  }
}

# Associating the routing table to our public subnets
resource "aws_route_table_association" "main-public" {
  count = length(var.public_subnets_cidr)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Creating the NAT route table
resource "aws_route_table" "nat_rt" {
  count = length(aws_nat_gateway.nat_gateway)
  vpc_id = aws_vpc.com_interne.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }
  tags = {
    Name = "Route table for NAT Gateway"
  }
}


# Associating the NAT route table to our private subnets
resource "aws_route_table_association" "nat_rt_private_sub" {
  count = length(var.private_subnets_cidr)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.nat_rt[count.index].id
}