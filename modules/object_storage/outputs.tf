/**
 * Copyright © 2014-2022 HashiCorp, Inc.
 *
 * This Source Code is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this project, you can obtain one at http://mozilla.org/MPL/2.0/.
 *
 */

output "s3_bucket_vault_license_arn" {
  value = aws_s3_bucket.vault_license_bucket.arn
}

output "s3_bucket_vault_license" {
  value = aws_s3_bucket.vault_license_bucket.id
}

output "vault_license_name" {
  value = var.vault_license_name
}
