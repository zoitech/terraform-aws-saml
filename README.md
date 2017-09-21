# AWS generic account setup
Terraform module which creates AWS access via SAML.
* Create SAML Provider
* Create Role for SAML access
* Attach given set of policies

## Usage
```hcl
module "saml" {
  source = "zoitech/saml/aws"
  role_name = "SAML-Admin"
  provider_metadata_url = "https://something.com/metadata.xml"
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
