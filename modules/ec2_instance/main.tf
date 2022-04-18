module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.name

  ami                    = var.ami
  iam_instance_profile   = var.iam_instance_profile
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = var.user_data

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}