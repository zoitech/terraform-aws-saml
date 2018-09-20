resource "aws_iam_role" "DelegateUser" {
  count              = "${length(var.role_names)}"
  name               = "${element(var.role_names, count.index)}"
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
resource "aws_iam_role_policy_attachment" "DelegateUser_Attachment" {
  count      = "${length(var.role_names)}"
  role       = "${element(aws_iam_role.DelegateUser.*.name, count.index)}"
  policy_arn = "${element(var.role_policies, count.index)}"
}
