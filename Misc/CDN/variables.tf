variable "cdn_profile_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."

}

variable "location" {
  type        = string
  default     = ""
  description = "Location where all these resources will be created."

}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name for all the resources."

}

variable "cdn_sku" {
  type    = string
  default = ""
  validation {
    condition     = contains(["Standard_Akamai", "Standard_ChinaCdn", "Standard_Microsoft", "Standard_Verizon", "Premium_Verizon"], var.cdn_sku)
    error_message = "Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
  }
  description = "The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."

}

variable "cdn_endpoint_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the CDN Endpoint. Changing this forces a new resource to be created."

}

variable "cdn_origin" {
  type        = string
  default     = ""
  description = "The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint. Changing this forces a new resource to be created."

}

variable "cdn_host_name" {
  type        = string
  default     = ""
  description = "A string that determines the hostname/IP address of the origin server. This string can be a domain name, Storage Account endpoint, Web App endpoint, IPv4 address or IPv6 address. Changing this forces a new resource to be created."

}
