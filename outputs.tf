output "role"{
  description = "ARN of the Role"
  value = "${aws_iam_role.DelegateUser.id}"
}
output "saml_provider"{
  description = "ARN of the SAML Provider"
  value = "${aws_iam_saml_provider.saml.id}"
}
