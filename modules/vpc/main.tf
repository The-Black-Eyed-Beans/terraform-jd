data "aws_availability_zones" "available" {}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "3.2.0"

  name                 = var.vpc.name
  cidr                 = var.vpc.cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.vpc.private_subnets
  public_subnets       = var.vpc.public_subnets
  enable_nat_gateway   = var.vpc.enable_nat_gateway
  single_nat_gateway   = var.vpc.single_nat_gateway
  enable_dns_hostnames = var.vpc.enable_dns_hostnames 

  tags                 = zipmap(var.vpc.vpc_tag_keys,var.vpc.vpc_tag_values)

  public_subnet_tags   = zipmap(var.vpc.public_subnet_tag_keys,var.vpc.public_subnet_tag_values) 

  private_subnet_tags  = zipmap(var.vpc.private_subnet_tag_keys,var.vpc.private_subnet_tag_values)
}