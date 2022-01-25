variable "redis_cache" {
  type        = string
  default     = ""
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
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

variable "redis_capacity" {
  type        = number
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."

}

variable "redis_family" {
  type    = string
  default = ""
  validation {
    condition     = contains(["C", "P"], var.redis_family)
    error_message = "Valid values are C (for Basic/Standard SKU family) and P (for Premium)."
  }
  description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)."
}

variable "redis_sku" {
  type    = string
  default = ""
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.redis_sku)
    error_message = "Possible values are Basic, Standard and Premium."
  }
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."

}

variable "non_ssl_port_redis" {
  type        = string
  default     = "false"
  description = "Enable the non-SSL port (6379) - disabled by default. Valid options are true or false"
}

variable "min_tls_redis" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub."

}