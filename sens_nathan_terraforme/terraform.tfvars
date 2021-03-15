# The region to deploy your AWS architecture
region = "eu-west-1"

// Public Key to your AWS account 
key-account = "YOUR-KEY-ACCOUNT"

# Private Key of your AWS account
private-key-account = "YOUR-PRIVATE-KEY"

# The CIDR block of your VPC
vpc_cidr = "10.0.0.0/16"

# The CIDR list of your public subnets
public_subnet_cidr = ["10.0.2.0/24","10.0.3.0/24"]

# The lCIDR list of your private subnets
private_subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24"]

# The availability zone you will user for your subnets
availability_zone = ["eu-west-1a", "eu-west-1b"]

# The subnet zone name used in complement to the subnet name (int-public-subnet-AZ or int-private-subnet-AZ)
subnet_name_zone = ["a","b"]

# Contain the instance name, the size to use and the ami used for the instance.

aws_instance = {
  name: "My instances",
  size: "t2.micro",
  ami: "ami-059db4e559f0ad913"
}

# The number of instance to attribute in each subnet.
instances_per_subnet = 2