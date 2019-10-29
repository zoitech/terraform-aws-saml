locals {
  roles         = var.roles == null ? local.default_roles : var.roles
  default_roles = var.create_all_roles == true ? local.all_roles : local.standard_roles
  standard_roles = [
    {
      role_name        = "SAML_FullAccess"
      role_policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_FullAccess"
    },
    {
      role_name        = "SAML_ReadOnly"
      role_policy_arn  = "arn:aws:iam::aws:policy/ReadOnlyAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_ReadOnly"
    },
    {
      role_name        = "SAML_PowerUser"
      role_policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_PowerUserAccess"
    },
  ]

  all_roles = concat(local.standard_roles, [
    {
      role_name        = "SAML_Billing"
      role_policy_arn  = "arn:aws:iam::aws:policy/job-function/Billing"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_Billing"
    },
    {
      role_name        = "SAML_Logging"
      role_policy_arn  = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_Logging - Read Only"
    }
  ])

}
