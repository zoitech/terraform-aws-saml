variable "provider_name" {
  description = "The name of the provider."
  default     = "ADFS"
}

variable "create_all_roles" {
  description = "Add billing and logging roles"
  default     = false
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
variable "provider_metadata_file" {
  description = "The path to of the metadatafile"
  default     = null
}
