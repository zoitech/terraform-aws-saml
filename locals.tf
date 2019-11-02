locals {
  roles         = var.roles == null ? local.default_roles : var.roles
  default_roles = var.create_billing_role == true && var.create_logging_role == true ? local.all_roles : var.create_billing_role == true && var.create_logging_role == false ? concat(local.standard_roles, local.billing_role) : var.create_billing_role == false && var.create_logging_role == true ? concat(local.standard_roles, local.logging_role) : local.standard_roles
  standard_roles = [
    {
      role_name        = "SAML_FullAccess"
      role_policy_arn  = var.fullaccess_role_custom_policy_arn == null ? "arn:aws:iam::aws:policy/AdministratorAccess" : var.fullaccess_role_custom_policy_arn == null
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_FullAccess"
    },
    {
      role_name        = "SAML_ReadOnly"
      role_policy_arn  = var.readonly_role_custom_policy_arn == null ? "arn:aws:iam::aws:policy/ReadOnlyAccess" : var.readonly_role_custom_policy_arn
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_ReadOnly"
    },
    {
      role_name        = "SAML_PowerUser"
      role_policy_arn  = var.poweruser_role_custom_policy_arn == null ? "arn:aws:iam::aws:policy/PowerUserAccess" : var.poweruser_role_custom_policy_arn
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_PowerUserAccess"
    },
  ]

  billing_role = [
    {
      role_name        = "SAML_Billing"
      role_policy_arn  = var.billing_role_custom_policy_arn == null ? "arn:aws:iam::aws:policy/job-function/Billing" : var.billing_role_custom_policy_arn
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_Billing"
    },
  ]

  logging_role = [
    {
      role_name        = "SAML_Logging"
      role_policy_arn  = var.logging_role_custom_policy_arn == null ? "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess" : var.logging_role_custom_policy_arn
      role_description = "ROLE_AWS_${data.aws_caller_identity.current.account_id}_Logging - Read Only"
    },
  ]

  all_roles = concat(local.standard_roles, local.billing_role, local.logging_role)

}
