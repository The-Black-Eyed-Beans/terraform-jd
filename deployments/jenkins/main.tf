resource "aws_instance" "jenkins" {

  ami                    = var.ami
  iam_instance_profile   = aws_iam_instance_profile.jenkins_profile.name
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = base64encode(templatefile("${path.module}/${var.user_data_master_node}", local.vars))
  user_data_replace_on_change = true

  tags = {
    Name = var.name
    Environment = "development"
  }
}

locals {
  vars = {
    WORKER_ADDRESS = aws_instance.worker.private_ip
  }
}

resource "aws_instance" "worker" {

  ami                    = var.ami
  iam_instance_profile   = aws_iam_instance_profile.jenkins_profile.name
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = "${file(var.user_data_worker_node)}"
  user_data_replace_on_change = true

  tags = {
    Name = "worker-node"
    Environment = "development"
  }
}

resource "aws_route53_record" "jenkins_record" {
  zone_id = var.zone_id
  name    = var.dns_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.ec2_eip.public_ip]
}

resource "aws_eip" "ec2_eip" {
  vpc                     = true

  tags                    = {
      Name     = "Nginx EIP"
      Environment = "development"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = aws_eip.ec2_eip.id

  depends_on = [
    aws_instance.jenkins
  ]
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "jenkins_server_profile"
  role = aws_iam_role.jenkins_role.name
}

resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_server_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Environment = "development"
  }
}

resource "aws_iam_policy_attachment" "ec2_policy" {
  name       = "nginx-ec2"
  roles      = [aws_iam_role.jenkins_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "s3_read_policy" {
  name       = "nginx-s3"
  roles      = [aws_iam_role.jenkins_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

output iam_role {
  value       = aws_iam_role.jenkins_role
  sensitive   = false
  description = "IAM role to attach to Nginx worker."
}

output worker_private_ip {
  value       = aws_instance.worker.private_ip
  sensitive   = false
  description = "Worker's private ip address."
}