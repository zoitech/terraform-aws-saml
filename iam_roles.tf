resource "aws_iam_role" "delegate_user" {
  count              = length(local.roles)
  name               = lookup(element(local.roles, count.index), "role_name")
  description        = lookup(element(local.roles, count.index), "role_description")
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${aws_iam_saml_provider.saml.id}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "delegate_user_attachment" {
  count      = length(local.roles)
  role       = aws_iam_role.delegate_user[count.index].name
  policy_arn = lookup(element(local.roles, count.index), "role_policy_arn")
}
