variable load_balancer {
    type                   = list(object({
        name                 = string,
        internal             = bool,
        load_balancer_type   = string,
        security_groups      = list(string)
        subnets              = list(string)
     }))
  description = "List of Load Balancer objects."
}
