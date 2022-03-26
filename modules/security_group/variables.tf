variable "vpc_id" {
  type = string
  description = "ID of VPC"    
}

variable "security_group" {
  type = object({
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
  })
  description = "Map of Security Groups"
}