module "ansible" {
  source  = "../../modules/ec2_instance"

  name                   = var.name
  ami                    = var.ami
  iam_instance_profile   = aws_iam_instance_profile.ansible_profile.name
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = "${file("install_ansible.sh")}"
}

resource "aws_iam_instance_profile" "ansible_profile" {
  name = "ansible_profile"
  role = aws_iam_role.ansible_role.name
}

resource "aws_iam_role" "ansible_role" {
  name = "ansible_role"

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
  name       = "ansible-ec2"
  roles      = [aws_iam_role.ansible_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

output iam_role {
  value       = aws_iam_role.ansible_role
  sensitive   = false
  description = "IAM role to attach to Ansible worker."
}