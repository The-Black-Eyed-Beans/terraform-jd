resource "aws_lb" "load_balancer" {
  count              = length(var.load_balancer)
  
  name               = var.load_balancer[count.index].name
  internal           = var.load_balancer[count.index].internal
  load_balancer_type = var.load_balancer[count.index].load_balancer_type
  security_groups    = var.load_balancer[count.index].security_groups
  subnets            = var.load_balancer[count.index].subnets

  tags = {
    Environment = "${var.load_balancer[count.index].name} - ${count.index}"
  }
}

output get_lbs {
  value       = aws_lb.load_balancer
  sensitive   = false
  description = "Return list of load balancers."
}
