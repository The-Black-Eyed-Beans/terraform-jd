variable "vpc" {
  type = map(object({
      name                      = string,
      cidr                      = string,
      private_subnets           = list(string),
      public_subnets            = list(string),
      enable_nat_gateway        = bool,
      single_nat_gateway        = bool,
      enable_dns_hostnames      = bool
  }))
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

#############

variable "alb_gateway" {
  type = object({
    name:string,
    internal:bool,
    load_balancer_type:string
  })
}

#############

variable "security_group" {
  type = list(object({
     name = string,
     description = string,
     tag_name = string,
     ingress = list(object({
        description = string,
        port = string,
        protocol = string,
        cidr_blocks = string,
        self = bool
     })),
     egress = list(object({
        description = string,
        port = string,
        protocol = string,
        cidr_blocks = string,
        ipv6_cidr_blocks = string
     }))
  }))
  description = "Map of Security Groups"
}

###############################

variable "route53_gateway_a_record" {
  type = object({
    zone_id = string,
    name = string,
    type = string,
    allow_overwrite = bool
  })

  description = "List of Route 53 A records."
}
