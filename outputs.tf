output "reader_aws_access_key_id" {
  value = aws_iam_access_key.reader.id
  sensitive = true
}

output "reader_aws_secret_access_key" {
  value = aws_iam_access_key.reader.secret
  sensitive = true
}