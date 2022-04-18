variable "is_ecs_cluster" {
  type = bool
}

variable "eks_subnet_tag_keys" {
  type = list(string)
}

variable "eks_subnet_tag_values" {
  type = list(string)
}

variable "vpc" {
  type = object({
      name                      = string,
      cidr                      = string,
      private_subnets           = list(string),
      public_subnets            = list(string),
      enable_nat_gateway        = bool,
      single_nat_gateway        = bool,
      enable_dns_hostnames      = bool
  })
  description                   = "VPC details."
}

variable "private_subnet_tag_keys" {
  type        = list(string)
  description = "Key value of private subnet tags."
}

variable "private_subnet_tag_values" {
  type        = list(string)
  description = "Value of keys for private subnet tags."
}

variable "public_subnet_tag_keys" {
  type        = list(string)
  description = "Key value of public subnet tags."
}

variable "public_subnet_tag_values" {
  type        = list(string)
  description = "Value of keys for public subnet tags."
}

variable "vpc_tag_keys" {
  type        = list(string)
  description = "Key value of vpc subnet tags."
}

variable "vpc_tag_values" {
  type        = list(string)
  description = "Value of keys for vpc subnet tags."
}