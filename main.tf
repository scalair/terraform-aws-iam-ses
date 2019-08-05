module "iam_user" {
  source = "github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-user?ref=v2.1.0"

  name          = var.iam_user_name
  pgp_key       = var.iam_user_pgp_key
  force_destroy = var.iam_user_force_destroy

  tags = var.tags
}

resource "aws_iam_policy" "policy" {
  name   = "${var.aws_iam_policy_name}"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ses:*"
        ],
        "Resource": "*"
      }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "ses" {
  user       = "${module.iam_user.this_iam_user_name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
