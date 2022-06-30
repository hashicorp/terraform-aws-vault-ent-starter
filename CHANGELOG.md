## Unreleased

* Add `permissions_boundary` variable to support creating the IAM Role with a permissions boundary

## 0.2.1 (June 28, 2022)

* Update package name syntax in userdata script to prevent breakage when installing latest versions of Vault enterprise.

## 0.2.0 (June 06, 2022)

* Update examples directory with quickstart file that reduces number of steps to
  provision pre-reqs
* Remove data sources for AWS subnets and allow user to explicitly specify
  private subnet IDs in main module
* Update main module outputs
* Update default Vault version to latest version (1.10.3)
* Update Terraform version pin

## 0.1.2 (August 19, 2021)

* Update TLS directory permissions
* Remove client cert and key from profile script
* Update indentation in configuration file
* Enable EC2 IMDSv2 tokens in launch template
* Support using EC2 IMDSv2 in user-data script

## 0.1.1 (August 13, 2021)

* Update config and file permissions to match Deployment Guide
* Update disk specs to new Reference Architecture recommendations
* Update default version to 1.8.1

## 0.1.0 (July 28, 2021)

* Initial release
