resource "aws_iam_user" "sync" {
  name = "truth_node_sync_user"
}

resource "aws_iam_user" "reader" {
  name = "truth_node_read_user"
}

resource "aws_iam_access_key" "sync" {
  user = aws_iam_user.sync.name
}

resource "aws_iam_access_key" "reader" {
  user = aws_iam_user.reader.name
}