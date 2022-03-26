output vpc_id {
  value       = module.vpc["vpc-1"].get_vpc.vpc_id
  sensitive   = false
  description = "VPC iD"
}

output private_subnets {
  value       = module.vpc["vpc-1"].get_vpc.private_subnets
  sensitive = false
  description = "List of private subnet IDs"
}

output security_groups {
  value       = module.my_security_group[*].get_sg.id
  sensitive   = false
  description = "List of Security Group IDs"
}

output load_balancer {
  value       = module.my_load_balancer.get_lbs
  sensitive   = false
  description = "List of Load Balancers"
}