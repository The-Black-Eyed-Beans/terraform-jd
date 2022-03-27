locals {
  vpc_tags             = {
    public_subnet_tag_keys    = var.cluster_type == "EKS" ? zipmap(var.public_subnet_tag_keys,var.eks_subnet_tag_keys) :var.public_subnet_tag_keys
    public_subnet_tag_values  = var.cluster_type == "EKS" ? zipmap(var.public_subnet_tag_values,var.eks_subnet_tag_values) :var.public_subnet_tag_values
    private_subnet_tag_keys   = var.cluster_type == "EKS" ? zipmap(var.private_subnet_tag_keys,var.eks_subnet_tag_keys) :var.private_subnet_tag_keys
    private_subnet_tag_values = var.cluster_type == "EKS" ? zipmap(var.private_subnet_tag_values,var.eks_subnet_tag_values) :var.private_subnet_tag_values
    vpc_tag_keys              = var.vpc_tag_keys 
    vpc_tag_values            = var.vpc_tag_values
  }
}

module "vpc" {
  source                    = "../../modules/vpc"
  vpc                       = merge(var.vpc, local.vpc_tags)

  depends_on                = [local.vpc_tags]
}