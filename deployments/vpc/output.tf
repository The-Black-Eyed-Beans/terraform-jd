output vpc_id {
  value       = module.vpc.get_vpc.vpc_id
  sensitive   = true
  description = "VPC iD"
}

output private_subnets {
  value       = module.vpc.get_vpc.private_subnets
  sensitive = true
  description = "List of private subnet IDs"
}

output public_subnets {
  value       = module.vpc.get_vpc.public_subnets
  sensitive = true
  description = "List of private subnet IDs"
}