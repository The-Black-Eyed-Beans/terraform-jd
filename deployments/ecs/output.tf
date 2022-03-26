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
  value       = [for sg in module.my_security_group: {name: sg.get_sg.name, id: sg.get_sg.id}]
  sensitive   = false
  description = "List of Security Group IDs"
}

output load_balancer {
  value       = module.my_load_balancer.get_lbs[0].name
  sensitive   = false
  description = "List of Load Balancers"
}

output cluster {
  value = aws_ecs_cluster.cluster.name
  sensitive   = false
  description = "Name of create ECS Cluster"
}

output ssl_cert {
  value = aws_acm_certificate.cert.arn
  sensitive   = false
  description = "SSL of Gateway domain."
}

output service_secrets {
  value = module.secrets.service_secrets
  sensitive   = false
  description = "List of service secrets."
}

output proxy_service_secrets {
  value = module.secrets.proxy_secret_name
  sensitive   = false
  description = "Secret for proxy server."
}