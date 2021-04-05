output "robot_user_arn" {
  value = aws_iam_user.robot_user.arn
  description = "Arn of the robot user for programmatic access"
}

output "robot_account_id" {
  value = aws_iam_access_key.robot_user.id
}

output "robot_account_secret" {
  value = aws_iam_access_key.robot_user.secret
}