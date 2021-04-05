resource "aws_iam_user" "robot_user" {
  name = "robot_user"

  tags = var.tags
}

resource "aws_iam_access_key" "robot_user" {
  user = aws_iam_user.robot_user.name
}