locals {
  vpc_tags             = {
    public_subnet_tag_keys    = var.is_ecs_cluster ? var.public_subnet_tag_keys : concat(var.public_subnet_tag_keys,var.eks_subnet_tag_keys)
    public_subnet_tag_values  = var.is_ecs_cluster ? var.public_subnet_tag_values : concat(var.public_subnet_tag_values,var.eks_subnet_tag_values)
    private_subnet_tag_keys   = var.is_ecs_cluster ? var.private_subnet_tag_keys : concat(var.private_subnet_tag_keys,var.eks_subnet_tag_keys)
    private_subnet_tag_values = var.is_ecs_cluster ? var.private_subnet_tag_values : concat(var.private_subnet_tag_values,var.eks_subnet_tag_values) 
    vpc_tag_keys              = var.vpc_tag_keys 
    vpc_tag_values            = var.vpc_tag_values
  }
}

module "vpc" {
  source                    = "../../modules/vpc"
  vpc                       = merge(var.vpc, local.vpc_tags)

  depends_on                = [local.vpc_tags]
}