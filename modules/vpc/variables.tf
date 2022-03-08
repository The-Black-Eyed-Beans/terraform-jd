variable "vpc" {
  type = object({
      name                      = string,
      cidr                      = string,
      private_subnets           = list(string),
      public_subnets            = list(string),
      public_subnet_tag_keys    = list(string),
      public_subnet_tag_values  = list(string),
      private_subnet_tag_keys   = list(string),
      private_subnet_tag_values = list(string),
      vpc_tag_keys              = list(string),
      vpc_tag_values            = list(string),
      enable_nat_gateway        = bool,
      single_nat_gateway        = bool,
      enable_dns_hostnames      = bool,
  })
  description                   = "VPC details."
}