vpc = {   
  vpc-1 = {
    cidr                        = "101.0.0.0/16"
    enable_dns_hostnames        = true
    enable_nat_gateway          = true
    name                        = "Aline Financial - jd"
    private_subnets             = ["101.0.101.0/24", "101.0.102.0/24", "101.0.103.0/24"]
    public_subnets              = ["101.0.1.0/24", "101.0.2.0/24", "101.0.3.0/24"]
    single_nat_gateway          = true
  } 
}

vpc_tag_keys = ["name"]
vpc_tag_values = ["Aline Financial - jd"]

private_subnet_tag_keys = ["name"]
private_subnet_tag_values = ["private subnet - jd"]

public_subnet_tag_keys = ["name"]
public_subnet_tag_values = ["public subnet - jd"]
