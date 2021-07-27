# AWS Object Storage Module

## Required variables

* `kms_key_arn` - KMS Key ARN used for S3 object encryption
* `resource_name_prefix` - Resource name prefix used for tagging and naming AWS resources
* `vault_license_filepath` - Absolute filepath to location of Vault license file
* `vault_license_name` - Filename for Vault license file

## Example usage

```hcl
module "object_storage" {
  source = "./modules/object_storage"

  kms_key_arn            = var.kms_key_arn
  resource_name_prefix   = var.resource_name_prefix
  vault_license_filepath = var.vault_license_filepath
  vault_license_name     = var.vault_license_name
}
```
