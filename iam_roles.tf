resource "aws_iam_role" "DelegateUser" {
    name = "${var.role_name}"
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
    role = "${aws_iam_role.DelegateUser.name}"
    policy_arn = "${element(var.role_policies, count.index)}"
    count = "${length(var.role_policies)}"
}
