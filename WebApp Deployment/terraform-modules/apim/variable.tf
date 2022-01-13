variable "apim_service" {
  type        = string
  description = "Name of the APIM service"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources are created."
}

variable "rg_Name" {
  type        = string
  description = "Resource Group name for these resource creation."
}

variable "apim_publisher" {
  type        = string
  description = "Name of the APIM publisher."
}

variable "apim_publisher_email" {
  type        = string
  description = "APIM publisher email."
}

variable "apim_sku" {
  type        = string
  description = "Sku for the APIM to be created."
}
