variable "name" {
    type = string
    description = "Secret name."
}

variable "secret_keys" {
    type = list(string)
    description = "List of keys for secrets."
}

variable "secret_values" {
    type = list(string)
    description = "List of values for secrets."  
}