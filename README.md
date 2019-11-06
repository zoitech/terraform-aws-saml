# terraform-aws-saml
Terraform module for creating necessary resources for SAML.

## Description

Terraform module which sets up SAML login via the following resources:

* Identity Provider
* IAM Roles
* Attachment of IAM Policies to IAM Roles

## Usage

By default:

the identity provider will be created with the name "ADFS".  

3 standard roles are created with the names: "SAML_FullAccess", "SAML_ReadOnly" and "SAML_PowerUser" with the assigned policies "AdministratorAccess", "ReadOnlyAccess", and "PowerUserAccess" respectively.

```hcl
module "iam_saml" {
  source                 = "git::https://github.com/zoitech/terraform-aws-saml.git"  
}
```

### Billing and Logging Roles

To create additonal billing and loggin roles, set the variables "create_billing_role" and "create_logging_role" to "true" (without quotes). This enables the possibility of creating two additonal roles: "SAML_Billing" and "SAML_Logging" with the assigned policies "Billing" and "CloudWatchLogsReadOnlyAccess" respectively.

```hcl
module "iam_saml" {
  source                 = "git::https://github.com/zoitech/terraform-aws-saml.git"
  provider_name          = "my-saml-provider"
  provider_metadata_file = "metadata.xml"
  create_billing_role    =  true
  create_logging_role    =  true
}
}
```

### Custom Roles and Policies

To override the default roles and policies (as described above), set the "roles" list of maps/objects variable with a configuration including the "role_name", "role_policy_arn" and "role_description" arguments as shown below:

```hcl
module "saml" {
  source                 = "git::https://github.com/zoitech/terraform-aws-saml.git"
  provider_name          = "my-saml-provider"
  provider_metadata_file = "metadata.xml"
  roles = [
    {
      role_name        = "SAML_FullAccess"
      role_policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
      role_description = "ROLE_AWS_FullAccess"
    },
    {
      role_name        = "SAML_ReadOnly"
      role_policy_arn  = "arn:aws:iam::aws:policy/ReadOnlyAccess"
      role_description = "ROLE_AWS_ReadOnly"
    },
  ]
  
}
```

### To reference a tagged version

```hcl
module "iam_saml" {
  source = "git::https://github.com/zoitech/terraform-aws-saml.git?ref=0.0.3"  
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
