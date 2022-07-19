/**
 * Copyright © 2014-2022 HashiCorp, Inc.
 *
 * This Source Code is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this project, you can obtain one at http://mozilla.org/MPL/2.0/.
 *
 */

resource "aws_iam_instance_profile" "vault" {
  name_prefix = "${var.resource_name_prefix}-vault"
  role        = var.user_supplied_iam_role_name != null ? var.user_supplied_iam_role_name : aws_iam_role.instance_role[0].name
}

resource "aws_iam_role" "instance_role" {
  count                = var.user_supplied_iam_role_name != null ? 0 : 1
  name_prefix          = "${var.resource_name_prefix}-vault"
  permissions_boundary = var.permissions_boundary
  assume_role_policy   = data.aws_iam_policy_document.instance_role.json
}

data "aws_iam_policy_document" "instance_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "cloud_auto_join" {
  count  = var.user_supplied_iam_role_name != null ? 0 : 1
  name   = "${var.resource_name_prefix}-vault-auto-join"
  role   = aws_iam_role.instance_role[0].id
  policy = data.aws_iam_policy_document.cloud_auto_join.json
}

data "aws_iam_policy_document" "cloud_auto_join" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:DescribeInstances",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "auto_unseal_s3_license" {
  count  = var.user_supplied_iam_role_name != null ? 0 : 1
  name   = "${var.resource_name_prefix}-vault-auto-unseal"
  role   = aws_iam_role.instance_role[0].id
  policy = data.aws_iam_policy_document.auto_unseal_s3_license.json
}

data "aws_iam_policy_document" "auto_unseal_s3_license" {
  statement {
    effect = "Allow"

    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
    ]

    resources = [
      var.kms_key_arn,
    ]
  }
}

resource "aws_iam_role_policy" "session_manager" {
  count  = var.user_supplied_iam_role_name != null ? 0 : 1
  name   = "${var.resource_name_prefix}-vault-ssm"
  role   = aws_iam_role.instance_role[0].id
  policy = data.aws_iam_policy_document.session_manager.json
}

data "aws_iam_policy_document" "session_manager" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "secrets_manager" {
  count  = var.user_supplied_iam_role_name != null ? 0 : 1
  name   = "${var.resource_name_prefix}-vault-secrets-manager"
  role   = aws_iam_role.instance_role[0].id
  policy = data.aws_iam_policy_document.secrets_manager.json
}

data "aws_iam_policy_document" "secrets_manager" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue",
    ]

    resources = [
      var.secrets_manager_arn,
    ]
  }
}

resource "aws_iam_role_policy" "s3_bucket_vault_license" {
  count  = var.user_supplied_iam_role_name != null ? 0 : 1
  name   = "${var.resource_name_prefix}-vault-license-s3"
  role   = aws_iam_role.instance_role[0].id
  policy = data.aws_iam_policy_document.s3_bucket_vault_license.json
}

data "aws_iam_policy_document" "s3_bucket_vault_license" {
  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      var.aws_bucket_vault_license_arn,
      "${var.aws_bucket_vault_license_arn}/*",
    ]
  }
}
