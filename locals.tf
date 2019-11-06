locals {
  roles         = var.roles == null ? local.default_roles : var.roles
  default_roles = var.create_billing_role == true && var.create_logging_role == true ? local.all_roles : var.create_billing_role == true && var.create_logging_role == false ? concat(local.standard_roles, local.billing_role) : var.create_billing_role == false && var.create_logging_role == true ? concat(local.standard_roles, local.logging_role) : local.standard_roles
  standard_roles = [
    {
      role_name        = "Delegate-Saml-Admin"
      role_policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_FullAccess"
    },
    {
      role_name        = "Delegate-Saml-ReadOnly"
      role_policy_arn  = "arn:aws:iam::aws:policy/ReadOnlyAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_ReadOnly"
    },
    {
      role_name        = "Delegate-Saml-PowerUser"
      role_policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_PowerUserAccess"
    },
  ]

  billing_role = [
    {
      role_name        = "Delegate-Saml-Billing"
      role_policy_arn  = "arn:aws:iam::aws:policy/job-function/Billing"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_Billing"
    },
  ]

  logging_role = [
    {
      role_name        = "Delegate-Saml-Logging"
      role_policy_arn  = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_Logging - Read Only"
    },
  ]

  all_roles = concat(local.standard_roles, local.billing_role, local.logging_role)

}
