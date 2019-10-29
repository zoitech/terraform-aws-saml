## 0.0.3 (Unreleased)

BUG FIXES:
* providers.tf: provider aws overrides external provider aws ([#4](https://github.com/zoitech/terraform-aws-saml/issues/4))

BACKWARDS INCOMPATIBILITIES / NOTES:
* Terraform version 0.12.x

ENHANCEMENTS:
* Upgraded to terraform 0.12.x ([#6](https://github.com/zoitech/terraform-aws-saml/issues/6))
* Option to add additional billing and logging role ([#7](https://github.com/zoitech/terraform-aws-saml/issues/7))
* List variables "role_names" and "role_policies" combined into list of objects/maps variable ([#8](https://github.com/zoitech/terraform-aws-saml/issues/8))

## 0.0.2

BACKWARDS INCOMPATIBILITIES / NOTES:
* A role now only supports the adding of one policy.

NEW FEATURES:
* Multiple roles can be added to the IDP

ENHANCEMENTS:
*

BUG FIXES:
* 