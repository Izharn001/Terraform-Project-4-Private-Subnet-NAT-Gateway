provider "aws" {
  region = "us-east-1"
}

module "vpc" {
    source = "./modules/vpc"

    vpc_cidr     = "10.0.0.0/16"
    subnet_cidr  = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id     = module.vpc.private_subnet_id
  vpc_id        = module.vpc.vpc_id
  instance_type = "t2.micro"
  my_ip         = "2.216.186.220/32"
}