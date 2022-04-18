variable "ami" {
  type = string
  description = "Name of created EC2 instance."
}

variable "name" {
  type = string
  description = "Name of created AMI to be used."
}

variable "instance_type" {
  type = string
  description = "Instance type of EC2."
}

variable "iam_instance_profile" {
  type = string
  description = "IAM instance profile to be used."
}

variable "key_name" {
  type = string
  description = "Key to attach to EC2."
}

variable "monitoring" {
  type = bool
  default = true
}

variable "subnet_id" {
  type = string
  description = "Id of subnet to place EC2 instance."
}

variable "user_data" {
  type = string
  description = "Bootstrap script for EC2."
}

variable "vpc_security_group_ids" {
  type = list(string)
  description = "List of security group ids."
}