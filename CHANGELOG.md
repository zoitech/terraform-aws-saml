## 1.1.1

BACKWARDS INCOMPATIBILITIES / NOTES:
* Variable "create_all_roles" was removed

ENHANCEMENTS:
* Enable all roles to take a custom policy ([#11](https://github.com/zoitech/terraform-aws-saml/issues/11))

BUG FIXES:
* Make billing and logging role independent from one another ([#10](https://github.com/zoitech/terraform-aws-saml/issues/10))

## 1.0.1

BACKWARDS INCOMPATIBILITIES / NOTES:
* Terraform version 0.12.x

ENHANCEMENTS:
* Upgraded to terraform 0.12.x ([#6](https://github.com/zoitech/terraform-aws-saml/issues/6))
* Option to add additional billing and logging role ([#7](https://github.com/zoitech/terraform-aws-saml/issues/7))
* List variables "role_names" and "role_policies" combined into list of objects/maps variable ([#8](https://github.com/zoitech/terraform-aws-saml/issues/8))

BUG FIXES:
* providers.tf: provider aws overrides external provider aws ([#4](https://github.com/zoitech/terraform-aws-saml/issues/4))

## 0.0.2

BACKWARDS INCOMPATIBILITIES / NOTES:
* A role now only supports the adding of one policy.

NEW FEATURES:
* Multiple roles can be added to the IDP

ENHANCEMENTS:
*

BUG FIXES:
* 
