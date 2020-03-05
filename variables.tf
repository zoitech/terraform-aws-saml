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

variable "create_billing_role" {
  description = "For creating the Delegate-Saml-Billing role"
  default     = false
}

variable "create_logging_role" {
  description = "For creating the Delegate-Saml-Logging role"
  default     = false
}

variable "roles_extra_policies" {
  description = "Extra policies for custom defined roles and permissions"
  type = list
}
