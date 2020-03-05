resource "aws_iam_role_policy_attachment" "extra_policies" {
  count      = var.roles_extra_policies == null ? 0 : length(var.roles_extra_policies)
  role       = lookup(element(var.roles_extra_policies, count.index), "role_name")
  policy_arn = lookup(element(var.roles_extra_policies, count.index), "role_policy_arn")
  depends_on = [aws_iam_role.delegate_user]
}
