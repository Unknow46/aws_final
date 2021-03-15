variable "region" {
  description = "AWS Deployment region.."
}

variable "key-account" {
  description = "AWS public key account"
}

variable "private-key-account" {
  description = "AWS private key account"
}

# Networking :

variable "vpc_cidr" {
  description = "the CIDR of the vpc"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "The CIDR block for the private subnet"
}

variable "availability_zone" {
  type = list(string)
  description = "Availability zones.."
}

# The public subnet name to use
variable "public_subnet_name" {
  description = "int-public-subnet-AZ"
}

# The private subnet name to use
variable "private_subnet_name" {
  description = "int-private-subnet-AZ"
}

# the zone for our subnets
variable "subnet_name_zone" {
  type = list(string)
  description = "a,b"
}

# Instances :
variable "instances_per_subnet" {
  description = "Number of EC2 instance in each private subnet"
  type = number
  default = 2
}

variable "aws_instance" {
  type = object({
    name: string,
    size: string,
    ami: string
  })
}