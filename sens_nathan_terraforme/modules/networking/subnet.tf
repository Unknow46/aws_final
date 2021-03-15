# Public subnets of our architecture

resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id = aws_vpc.com_interne.id
  cidr_block = element(var.public_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = join("", [var.public_subnet_name, element(var.subnet_name_zone, count.index)])
    SubnetType = "public"
  }
}

# Private subnets of our architecture
resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.com_interne.id
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = join("", [var.private_subnet_name, element(var.subnet_name_zone, count.index)])
    SubnetType = "private"
  }
}

