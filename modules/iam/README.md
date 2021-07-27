# AWS IAM Module

## Required variables

* `aws_bucket_vault_license_arn` - ARN of S3 bucket with Vault license
* `aws_region` - Specific AWS region being used
* `kms_key_arn` - KMS Key ARN used for Vault auto-unseal permissions
* `resource_name_prefix` - Resource name prefix used for tagging and naming AWS resources
* `secrets_manager_arn` - Secrets manager ARN where TLS cert info is stored

## Example usage

```hcl
module "iam" {
  source = "./modules/iam"

  aws_bucket_vault_license_arn = var.s3_bucket_vault_license_arn
  aws_region                   = data.aws_region.current.name
  kms_key_arn                  = var.kms_key_arn
  resource_name_prefix         = var.resource_name_prefix
  secrets_manager_arn          = var.secrets_manager_arn
}
```
