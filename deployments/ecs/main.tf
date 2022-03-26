locals {
  vpc_tags             = {
    public_subnet_tag_keys    = var.public_subnet_tag_keys
    public_subnet_tag_values  = var.public_subnet_tag_values
    private_subnet_tag_keys   = var.private_subnet_tag_keys
    private_subnet_tag_values = var.private_subnet_tag_values
    vpc_tag_keys              = var.vpc_tag_keys 
    vpc_tag_values            = var.vpc_tag_values
  }
}

module "vpc" {
  for_each                  = var.vpc
  source                    = "../../modules/vpc"
  vpc                       = merge(each.value, local.vpc_tags)

  depends_on                = [local.vpc_tags]
}

module "my_security_group" {
  count                   = length(var.security_group)

  source                  = "../../modules/security_group"

  vpc_id                  = module.vpc["vpc-1"].get_vpc.vpc_id
  security_group          = var.security_group[count.index]

  depends_on              = [module.vpc]
}

module "my_load_balancer" {
    source                = "../../modules/load_balancer"
    load_balancer         = [
        {name:var.alb_gateway.name,
        internal:var.alb_gateway.internal,
        load_balancer_type:var.alb_gateway.load_balancer_type,
        security_groups:[module.my_security_group[0].get_sg.id],
        subnets:module.vpc["vpc-1"].get_vpc.public_subnets},
    ]
    depends_on            = [module.my_security_group]
}

resource "aws_route53_record" "gateway_alb_record" {
  zone_id         = var.route53_gateway_a_record.zone_id
  name            = var.route53_gateway_a_record.name
  type            = var.route53_gateway_a_record.type
  allow_overwrite = var.route53_gateway_a_record.allow_overwrite 
  alias {
    zone_id                = module.my_load_balancer.get_lbs[0].zone_id
    name                   = module.my_load_balancer.get_lbs[0].dns_name
    evaluate_target_health = true
  }
  depends_on            = [module.my_load_balancer]
}

resource "aws_acm_certificate" "cert" {
  domain_name       = "gateway.theblackeyedbeans.net"
  validation_method = "DNS"

  tags = {
    Environment = "prod"
  }

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  gateway-cert             = tolist(aws_acm_certificate.cert.domain_validation_options)[0]
}

resource "aws_route53_record" "validate_cert" {
  zone_id         = module.my_load_balancer.get_lbs[0].zone_id
  name            = local.gateway-cert.resource_record_name
  type            = local.gateway-cert.resource_record_type
  ttl             = "300" 
  allow_overwrite = true 
  records        = [local.gateway-cert.resource_record_value]
  depends_on            = [aws_acm_certificate.cert]
}

resource "aws_kms_key" "ecs-key" {
  description             = "example"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "ecs-logs" {
  name = "ecs-logs-jd"
}

resource "aws_ecs_cluster" "cluster" {
  name = "Aline-Financial-jd"

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.ecs-key.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.ecs-logs.name
      }
    }
  }
}