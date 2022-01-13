variable "sbnamespace" {
  type        = string
  description = "Name of the service bus namespace"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources are created."
}

variable "rg_Name" {
  type        = string
  description = "Resource Group name for these resource creation."
}

variable "sbsku" {
  type        = string
  description = "Service bus namespace SKU."
}

variable "sbnauth" {
  type        = string
  description = "Service Bus Namespace authorization rule."
}

variable "sbtopic" {
  type        = string
  description = "Service Bus Topic."
}

variable "sbsubscription" {
  type        = string
  description = "Service Bus Subscription."
}

variable "sbqueue" {
  type        = string
  description = "Service bus queue name."
}
