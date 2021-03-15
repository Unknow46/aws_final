
/*
Variables used across all modules.
*/


module "networking" {
  source = "./modules/networking"
  
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnets_cidr = var.public_subnet_cidr
  private_subnets_cidr = var.private_subnet_cidr
  availability_zones = var.availability_zone
  aws_instance = var.aws_instance
  instances_per_subnet = var.instances_per_subnet
  public_subnet_name = var.public_subnet_name
  private_subnet_name = var.private_subnet_name
  subnet_name_zone = var.subnet_name_zone
}

output "vpc-id" {
  value = module.networking.vpc_id
}

output "public-subnets-id" {
  value = module.networking.public_subnet_ids
}

output "private-subnets-id" {
  value = module.networking.private_subnet_ids
}

output "elb-dns-name" {
  value = module.networking.dns_elb
}