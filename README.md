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

3 standard roles are created with the names: "Delegate-Saml-Admin", "Delegate-Saml-ReadOnly" and "Delegate-Saml-PowerUser" with the assigned policies "AdministratorAccess", "ReadOnlyAccess", and "PowerUserAccess" respectively.

```hcl
module "iam_saml" {
  source                 = "git::https://github.com/zoitech/terraform-aws-saml.git"  
}
```

### Billing and Logging Roles

To create additonal billing and loggin roles, set the variables "create_billing_role" and "create_logging_role" to "true" (without quotes). This enables the possibility of creating two additonal roles: "Delegate-Saml-Billing" and "Delegate-Saml-Logging" with the assigned policies "Billing" and "CloudWatchLogsReadOnlyAccess" respectively.

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

To override the default roles and policies (as described above) and configure your own, set the "roles" list of maps/objects variable with a configuration including the "role_name", "role_policy_arn" and "role_description" arguments as shown below:

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
  source = "git::https://github.com/zoitech/terraform-aws-saml.git?ref=2.0.0"  
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.delegate_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.delegate_user_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_saml_provider.saml](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_saml_provider) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_billing_role"></a> [create\_billing\_role](#input\_create\_billing\_role) | For creating the Delegate-Saml-Billing role | `bool` | `false` | no |
| <a name="input_create_logging_role"></a> [create\_logging\_role](#input\_create\_logging\_role) | For creating the Delegate-Saml-Logging role | `bool` | `false` | no |
| <a name="input_provider_metadata_file"></a> [provider\_metadata\_file](#input\_provider\_metadata\_file) | The path to of the metadatafile | `any` | `null` | no |
| <a name="input_provider_name"></a> [provider\_name](#input\_provider\_name) | The name of the provider. | `string` | `"ADFS"` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | For custom defined roles and permissions | <pre>list(object({<br>    role_name        = string<br>    role_policy_arn  = string<br>    role_description = string<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arns"></a> [role\_arns](#output\_role\_arns) | ARN of the Role |
| <a name="output_saml_provider"></a> [saml\_provider](#output\_saml\_provider) | ARN of the SAML Provider |
