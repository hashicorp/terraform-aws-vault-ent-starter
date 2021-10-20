output "asg_name" {
  value = aws_autoscaling_group.vault.name
}

output "vault_sg_id" {
  description = "Security group ID of Vault cluster"
  value       = aws_security_group.vault.id
}
