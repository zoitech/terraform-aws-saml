# Settings
# Account ID
data "aws_caller_identity" "current" { }

variable "aws_region" {
  description = "The reqion where the ressrouces should be create. Unimportant as IAM."
  default = "eu-central-1"
}
variable "role_name" {
  description = "The name of the Role"
  default = "Delegate-Saml-Admin"
}
variable "role_policies" {
  description = "The policies attached to the role"
  default = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  type = "list"
}

variable "provider_name" {
  description = "The name of the provider."
  default = "default-saml-provider"
}
variable "provider_metadata_file" {
  description = "The path to of the metadatafile"
  default =""
}
