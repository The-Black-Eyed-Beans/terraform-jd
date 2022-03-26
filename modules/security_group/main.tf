resource "aws_security_group" "security_group" {
  name = var.security_group.name
  description = var.security_group.description
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each           = var.security_group.ingress
    content {
      description      = ingress.value["description"]
      from_port        = ingress.value["port"]
      to_port          = ingress.value["port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["self"] ? null : [ingress.value["cidr_blocks"]]
      self             = ingress.value["self"]
    }
  }
  dynamic "egress" {
    for_each           = var.security_group.egress
    content {
      description      = egress.value["description"]
      from_port        = egress.value["port"]
      to_port          = egress.value["port"]
      protocol         = egress.value["protocol"]
      cidr_blocks      = [egress.value["cidr_blocks"]]
      ipv6_cidr_blocks = [egress.value["ipv6_cidr_blocks"]]
    }
  }
  tags = {
    Name = var.security_group.tag_name
  }
}

output "get_sg" {
  description = "Returns IDs of Security Groups"
  value = aws_security_group.security_group
}