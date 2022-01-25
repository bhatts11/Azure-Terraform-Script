variable "fnc_app_plan_name" {
  type        = string
  default     = ""
  description = "App service plan name for webapp"
  validation {
    condition = (can(regex("^[a-zA-Z0-9-]*$", var.fnc_app_plan_name)))
    #condition     = !(can(regex("_", var.app_plan_name)))
    error_message = "App Service plan name can't have _ in the name."
  }
}
variable "fnc_appsvcplan_kind" {
  type        = string
  default     = "Windows"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
variable "fnc_appservice_tier" {
  type        = string
  default     = ""
  description = "Azure App service Tier (Standard,Free,Basic, etc .)"
  validation {
    condition     = contains(["Free", "Basic", "Standard", "Premium", "PremiumV2", "PremiumV3"], var.fnc_appservice_tier)
    error_message = "Unsupported App service plan Tier. Please refer https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans for available Tiers."
  }
}

variable "fnc_appservice_size" {
  type        = string
  default     = ""
  description = "Azure App service Tier size"
  validation {
    condition     = contains(["F1", "B1", "B2", "B3", "S1", "S2", "S3", "P1v2", "P2v2", "P2v2", "P1v3", "P2v3", "P3v3"], var.fnc_appservice_size)
    error_message = "Unsupported App Service Size. Please refer https://azure.microsoft.com/en-us/pricing/details/app-service/windows/ for list of available sizes."
  }
}

variable "function_app_strg_account" {
  type        = string
  default     = ""
  description = "Storage account to be used for function app"
  validation {
    condition     = (can(regex("^[a-zA-Z0-9-]*$", var.function_app_strg_account)))
    error_message = "Storage account name can only have alpanumeric values and dash in the name."
  }
}

variable "app_function_app" {
  type        = string
  default     = ""
  description = "Function app name for this deployment"
  validation {
    condition     = (can(regex("^[a-zA-Z0-9-]*$", var.app_function_app)))
    error_message = "Function app name can only have alpanumeric values and dash in the name."
  }
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for aks cluster deployment"
  validation {
    condition     = contains(["eastus2", "centralus"], lower(var.location))
    error_message = "Unsupported Azure Region specified for AKS. Only East US2 and Central US Azure Regions are supported."
  }
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
