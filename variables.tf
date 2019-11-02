variable "provider_name" {
  description = "The name of the provider."
  default     = "ADFS"
}

variable "provider_metadata_file" {
  description = "The path to of the metadatafile"
  default     = null
}

variable "roles" {
  description = "For custom defined roles and permissions"
  type = list(object({
    role_name        = string
    role_policy_arn  = string
    role_description = string
  }))
  default = null
}

variable "fullaccess_role_custom_policy_arn" {
  description = "Custom policy ARN for the SAML_FullAccess role"
  default     = null
}

variable "poweruser_role_custom_policy_arn" {
  description = "Custom policy ARN for the SAML_PowerUser role"
  default     = null
}

variable "readonly_role_custom_policy_arn" {
  description = "Custom policy ARN for the SAML_ReadOnly role"
  default     = null
}

variable "create_billing_role" {
  description = "Add billing role"
  default     = false
}

variable "billing_role_custom_policy_arn" {
  description = "Custom policy ARN for the SAML_Billing role"
  default     = null
}

variable "create_logging_role" {
  description = "Add logging role"
  default     = false
}

variable "logging_role_custom_policy_arn" {
  description = "Custom policy ARN for the SAML_Logging role"
  default     = null
}


