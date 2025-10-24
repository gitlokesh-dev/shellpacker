variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group to store Managed Image"
}

variable "location" {
  type        = string
  default     = "EastUS"
  description = "Azure region"
}
