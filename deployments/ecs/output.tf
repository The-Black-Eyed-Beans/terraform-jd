output security_groups {
  value       = [for sg in module.my_security_group: {(sg.get_sg.name): sg.get_sg.id}]
  sensitive   = true
  description = "List of Security Group IDs"
}

output load_balancer {
  value       = module.my_load_balancer.get_lbs[0].name
  sensitive   = true
  description = "List of Load Balancers"
}

output backend_load_balancer {
  value       = module.my_load_balancer.get_lbs[1].name
  sensitive   = true
  description = "List of Load Balancers"
}

output backend_load_balancer_dns {
  value       = module.my_load_balancer.get_lbs[1].dns_name
  sensitive   = true
  description = "List of Load Balancers"
}

output cluster {
  value = aws_ecs_cluster.cluster.name
  sensitive   = true
  description = "Name of create ECS Cluster"
}

output ssl_cert {
  value = aws_acm_certificate.cert.arn
  sensitive   = true
  description = "SSL of Gateway domain."
}

output service_secrets {
  value = module.secrets.service_secrets
  sensitive   = true
  description = "List of service secrets."
}

output proxy_service_secrets {
  value = module.secrets.proxy_secret_name
  sensitive   = true
  description = "Secret for proxy server."
}