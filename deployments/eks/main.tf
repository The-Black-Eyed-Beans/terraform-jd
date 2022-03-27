resource "aws_subnet" "subnets" {
    
}

# module "vpc" {
#   for_each                  = var.vpc
#   source                    = "../../modules/vpc-dev"
#   cluster_name              = var.cluster_name
#   vpc                       = merge(each.value, local.vpc_tags)

#   depends_on                = [local.vpc_tags]
# }

# locals {
#   keys                 = ["kubernetes.io/cluster/${var.cluster_name}","kubernetes.io/role/internal-elb"]
#   values               = ["shared", "1"]
#   vpc_tags             = {
#     subnet_tag_keys           = local.keys
#     subnet_tag_values         = local.values
#     tag_keys                  = [local.keys]
#     tag_values                = [local.values]
#   }
# }