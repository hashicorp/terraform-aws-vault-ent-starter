/**
 * Copyright © 2014-2022 HashiCorp, Inc.
 *
 * This Source Code is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this project, you can obtain one at http://mozilla.org/MPL/2.0/.
 *
 */

variable "common_tags" {
  type        = map(string)
  description = "(Optional) Map of common tags for all taggable AWS resources."
  default     = {}
}

variable "kms_key_arn" {
  type        = string
  description = "KMS Key ARN used for S3 object encryption"
}

variable "resource_name_prefix" {
  type        = string
  description = "Resource name prefix used for tagging and naming AWS resources"
}

variable "vault_license_filepath" {
  type        = string
  description = "Absolute filepath to location of Vault license file"
}

variable "vault_license_name" {
  type        = string
  description = "Filename for Vault license file"
}
