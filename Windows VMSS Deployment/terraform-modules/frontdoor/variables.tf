variable "FrontDoor_Name" {
  type        = string
  default     = ""
  description = "Name of Azure Front Door Resource to create"
  validation {
    condition     = length(var.FrontDoor_Name) > 4 && can(regex("dev", lower(var.FrontDoor_Name)))
    error_message = " The FrontDoor_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "FD_RoutingRuleName" {
  type        = string
  default     = ""
  description = "Name of the front door routing rule name"
  validation {
    condition     = length(var.FD_RoutingRuleName) > 6 && can(regex("dev", lower(var.FD_RoutingRuleName)))
    error_message = " The FD_RoutingRuleName must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "FD_FrontEndPointName" {
  type        = string
  default     = ""
  description = "Front door front end point name"
}
variable "FD_FrontEndHostName" {
  type        = string
  default     = ""
  description = "Front end hostname - usually it should be \" FrontDoor_Name.azurefd.net \"."
}
variable "FD_forwdProtocal" {
  type        = string
  default     = ""
  description = "Type of forward protocal need to use in routeConfiguration - like MatchRequest or Httpsonly"
}
variable "FD_BackendPoolName" {
  type        = string
  default     = ""
  description = "Front door backend pool name to use in routeConfiguration"
  validation {
    condition     = length(var.FD_BackendPoolName) > 6 && can(regex("dev", lower(var.FD_BackendPoolName)))
    error_message = " The FD_BackendPoolName must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "FD_BackendLBName" {
  type        = string
  default     = ""
  description = "Backend pool load balancer name - used for loadBalancingSettings"
}
variable "FD_BackendPoolHealthProbeName" {
  type        = string
  default     = ""
  description = "Backend pool health probe name - used for healthProbeSettings"
}
variable "FD_BackendPoolHost" {
  type        = string
  default     = ""
  description = "Backend pool address - address in backendpools configuration"
}
variable "FD_BackendPoolHostAddress" {
  type        = string
  default     = ""
  description = "backend pool host address - backendHostHeader in backenpools configuration"
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
