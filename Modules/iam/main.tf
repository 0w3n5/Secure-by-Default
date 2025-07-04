resource "aws_iam_user" "users" {
  for_each = toset(var.users)

  name = each.key
  tags = merge(var.tags, {
    "Name" = each.key
  })
}

resource "aws_iam_user_policy_attachment" "default_attach" {
  for_each = aws_iam_user.users

  user       = each.value.name
  policy_arn = var.default_policy_arn
}

resource "aws_iam_access_key" "access_keys" {
  for_each = aws_iam_user.users

  user = each.value.name

  lifecycle {
    prevent_destroy = true
  }
}
