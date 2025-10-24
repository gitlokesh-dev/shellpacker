variable "subscription_id" {
  type    = string
  default = "<YOUR_SUBSCRIPTION_ID>"
}

variable "tenant_id" {
  type    = string
  default = "<YOUR_TENANT_ID>"
}

variable "client_id" {
  type    = string
  default = "<YOUR_CLIENT_ID>"
}

variable "client_secret" {
  type    = string
  default = "<YOUR_CLIENT_SECRET>"
}

variable "resource_group_name" {
  type    = string
  default = "packer-images-rg"
}

variable "pl_resource_group_name" {
  type    = string
  default = "network-rg"
}

variable "location" {
  type    = string
  default = "EastUS"
}

variable "vm_name" {
  type    = string
  default = "w11-packer"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2as_v5"
}

variable "vnet_name" {
  type    = string
  default = "vnet-prod"
}

variable "subnet_name" {
  type    = string
  default = "subnet-prod"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
  default   = "<YOUR_PASSWORD>"
}
