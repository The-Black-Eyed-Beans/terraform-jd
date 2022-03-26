resource "aws_secretsmanager_secret" "service_secret_keys" {
  count         = length(var.secrets)
  name          = var.secrets[count.index].name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "service_secret_values" {
  count         = length(aws_secretsmanager_secret.service_secret_keys)
  secret_id     = aws_secretsmanager_secret.service_secret_keys[count.index].id
  secret_string = var.secrets[count.index].secret_string
}

resource "aws_secretsmanager_secret" "proxy-secrets" {
  name = "prod/proxy/secrets"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "proxy-server-key-value" {
  secret_id     = aws_secretsmanager_secret.proxy-secrets.id
  secret_string = jsonencode(var.proxy-secrets)
}