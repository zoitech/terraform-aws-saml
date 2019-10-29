output "saml_provider" {
  description = "ARN of the SAML Provider"
  value       = aws_iam_saml_provider.saml.id
}
output "role_arns" {
  description = "ARN of the Role"
  value       = aws_iam_role.delegate_user[*].id
}

