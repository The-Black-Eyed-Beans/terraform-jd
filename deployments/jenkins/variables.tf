variable "ami" {
  type = string
  description = "Name of created EC2 instance."
}

variable "dns_name" {
  type = string
  description = "DNS of jenkins server."
}

variable "instance_type" {
  type = string
  description = "Instance type of EC2."
}

variable "key_name" {
  type = string
  description = "Key to attach to EC2."
}

variable "monitoring" {
  type = bool
  default = true
}

variable "name" {
  type = string
  description = "Name of created AMI to be used."
}

variable "subnet_id" {
  type = string
  description = "Id of subnet to place EC2 instance."
}

variable "user_data_master_node" {
  type = string
  description = "User data file for master node."
}

variable "user_data_worker_node" {
  type = string
  description = "User data file for worker node."
}

variable "vpc_security_group_ids" {
  type = list(string)
  description = "List of security group ids."
}

variable "zone_id" {
  type = string
  description = "Zone id for DNS record."
}
