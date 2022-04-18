resource "aws_secretsmanager_secret" "jenkins_sercice_secrets" {
  name = var.name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "proxy-server-key-value" {
  secret_id     = aws_secretsmanager_secret.jenkins_sercice_secrets.id
  secret_string = jsonencode(zipmap(var.secret_keys,var.secret_values))
}