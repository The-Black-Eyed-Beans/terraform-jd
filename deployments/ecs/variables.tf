variable "vpc_id" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "gateway_alb_dns" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable secrets {
   type = list(object({
      name = string,
      secret_string = string
   }))
}

variable proxy-secrets {
   type = object({
      ACCOUNT_SERVICE = string,
      BANK_SERVICE = string,
      TRANSACTION_SERVICE = string,
      UNDERWRITER_SERVICE = string,
      USER_SERVICE = string
   })
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
