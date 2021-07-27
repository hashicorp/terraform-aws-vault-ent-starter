output "s3_bucket_vault_license_arn" {
  value = aws_s3_bucket.vault_license_bucket.arn
}

output "s3_bucket_vault_license" {
  value = aws_s3_bucket.vault_license_bucket.id
}

output "vault_license_name" {
  value = var.vault_license_name
}
