# Settings
# Account ID
data "aws_caller_identity" "current" { }

variable "aws_region" {
  description = "The reqion where the ressrouces should be create. Unimportant as IAM."
  default = "eu-central-1"
}
variable "role_names" {
  type = "list"
  description = "The name(s) of the Role(s)"
  default = ["Delegate-Saml-Admin"]
}
variable "role_policies" {
  type = "list"
  description = "The policies attached to the role"
  default = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

variable "provider_name" {
  description = "The name of the provider."
  default = "default-saml-provider"
}
variable "provider_metadata_file" {
  description = "The path to of the metadatafile"
  default =""
}
