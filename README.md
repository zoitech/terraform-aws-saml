# AWS generic account setup
Terraform module which creates AWS access via SAML.
* Create SAML Provider
* Create Roles for SAML access
* Attach a policy to each role

## Usage
```hcl
module "saml" {
  source                 = "git::https://github.com/zoitech/terraform-aws-saml.git"
  provider_name          = "my-saml-provider"
  provider_metadata_file = "metadata.xml"
  role_names             = ["SAML-Admin", "SAML-ReadOnly]
  role_policies          = ["arn:aws:iam::aws:policy/AdministratorAccess","arn:aws:iam::aws:policy/ReadOnlyAccess"]
  
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
