variable "ehcluster" {
  type        = string
  default     = ""
  description = "Specifies the name of the EventHub Cluster resource. Changing this forces a new resource to be created."

}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "The name of the resource group in which the EventHub Cluster exists."
}

variable "location" {
  type        = string
  default     = ""
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."

}

variable "eh_sku" {
  type    = string
  default = ""
  validation {
    condition     = contains(["Dedicated_1"], var.eh_sku)
    error_message = "Accepted value is Dedicated_1 only."
  }
  description = "The sku name of the EventHub Cluster. The only supported value at this time is Dedicated_1."
}

variable "ehnamespace" {
  type        = string
  default     = ""
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."

}

variable "eh_namespace_sku" {
  type        = string
  default     = ""
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium. Please not that setting this field to Premium will force the creation of a new resource and also requires setting zone_redundant to true."
}

variable "eventhub" {
  type        = string
  default     = ""
  description = "Specifies the name of the EventHub resource."

}

variable "eventhub_partition_count" {
  type        = number
  description = "Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created."
}

variable "msg_retention" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub."

}
