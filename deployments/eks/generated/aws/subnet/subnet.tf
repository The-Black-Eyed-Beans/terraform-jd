resource "aws_subnet" "tfer--subnet-00a055b50369a35b8" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "101.0.102.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Aline Financial - jd-private-us-east-2b"
    Tier = "Private"
    name = "Aline Financial - jd"
  }

  tags_all = {
    Name = "Aline Financial - jd-private-us-east-2b"
    Tier = "Private"
    name = "Aline Financial - jd"
  }

  vpc_id = "vpc-0242624671642835b"
}

resource "aws_subnet" "tfer--subnet-060ada95faed6859b" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "101.0.101.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Aline Financial - jd-private-us-east-2a"
    Tier = "Private"
    name = "Aline Financial - jd"
  }

  tags_all = {
    Name = "Aline Financial - jd-private-us-east-2a"
    Tier = "Private"
    name = "Aline Financial - jd"
  }

  vpc_id = "vpc-0242624671642835b"
}

resource "aws_subnet" "tfer--subnet-0896a9af2bbad5d97" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "101.0.2.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Aline Financial - jd-public-us-east-2b"
    Tier = "Public"
    name = "Aline Financial - jd"
  }

  tags_all = {
    Name = "Aline Financial - jd-public-us-east-2b"
    Tier = "Public"
    name = "Aline Financial - jd"
  }

  vpc_id = "vpc-0242624671642835b"
}

resource "aws_subnet" "tfer--subnet-0a6572e7ef778259d" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0392f73423f2a877a"
}

resource "aws_subnet" "tfer--subnet-0aa18df321f01dcff" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "101.0.1.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Aline Financial - jd-public-us-east-2a"
    Tier = "Public"
    name = "Aline Financial - jd"
  }

  tags_all = {
    Name = "Aline Financial - jd-public-us-east-2a"
    Tier = "Public"
    name = "Aline Financial - jd"
  }

  vpc_id = "vpc-0242624671642835b"
}

resource "aws_subnet" "tfer--subnet-0acd6133e800910dc" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0392f73423f2a877a"
}

resource "aws_subnet" "tfer--subnet-0c2b970f1306db0e4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0392f73423f2a877a"
}
