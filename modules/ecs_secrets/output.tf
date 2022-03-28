output service_secrets {
  value       = [for secret in aws_secretsmanager_secret.service_secret_keys: {secret.name: secret.arn}]
  sensitive   = false
  description = "List of Secret objects for Services"
}

output proxy_secret_name {
  value       = aws_secretsmanager_secret.proxy-secrets.name
  sensitive   = false
  description = "Name of secret for proxy service."
}