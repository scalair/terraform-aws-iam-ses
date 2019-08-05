# Terraform AWS IAM SES
Module to create an AWS IAM user with policy to interact with SES.
This module use [iam-user](https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user) to create the iam user to access SES. This module required to use [Keybase](https://keybase.io/) to encrypt/decrypt user password, so you need a Keybase account before you can use that module (you can find more details on the [iam-user module page](https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user#notes-for-keybase-users)).