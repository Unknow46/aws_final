variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

# Networking

variable "public_subnets_cidr" {
  type        = list(string)
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "The CIDR block for the private subnet"
}

variable "region" {
  description = "The region to launch host"
}

variable "availability_zones" {
  type        = list(string)
  description = "The az that the resources will be launched"
}

variable "public_subnet_name" {}

variable "private_subnet_name" {}

variable "subnet_name_zone" {
  type = list(string)
  description = "a,b"
}


# Instances :

variable "instances_per_subnet" {
  description = "Number of EC2 instance in each private subnet"
  type = number
}

variable "aws_instance" {
  type = object({
    name: string,
    size: string,
    ami: string
  })
}