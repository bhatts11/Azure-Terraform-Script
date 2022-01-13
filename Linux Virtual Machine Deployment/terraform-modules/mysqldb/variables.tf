variable "MySQLServer_Name" {
  type        = string
  default     = ""
  description = "MySQL Server name to deploy"
  validation {
    condition     = length(var.MySQLServer_Name) > 6 && can(regex("dev", lower(var.MySQLServer_Name)))
    error_message = " The MySQLServer_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
variable "MySQLDB_Name" {
  type        = string
  default     = "wec-db01"
  description = "mysql db name to create for MySQL Server"
  validation {
    condition     = length(var.MySQLDB_Name) > 6 && can(regex("dev", lower(var.MySQLDB_Name)))
    error_message = " The MySQLDB_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "MySQLCharSet" {
  type        = string
  default     = ""
  description = "character set value to set for MySQL DB "
}
variable "MySQlCollection" {
  type        = string
  default     = ""
  description = "collaction value to set for MySQL DB "
}
