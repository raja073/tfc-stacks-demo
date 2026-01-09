variable "location" {
  description = "Location for the resources"
  type        = string
  default = "eastus"
}

variable "prefix" {
  description = "Prefix for the resources"
  type        = string
}

variable "suffix" {
  description = "Suffix for the resources"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "cidr_range" {
  description = "CIDR range for the vnet"
  type        = string
}

variable "subnets" {
  description = "Subnets for the vnet"
  type        = map(list(string))
}

variable "identity_token" { 
  type      = string 
  ephemeral = true
}

# variable "client_id" { 
#   type = string
# }

variable "subscription_id" { 
  type = string 
}

variable "tenant_id" { 
  type = string 
}