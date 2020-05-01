resource "aws_s3_bucket" "sync" {
  bucket_prefix = "polkadot-truth"
  acl = "private"
  region = var.region
}

resource "aws_iam_policy" "sync" {
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Resource": [
                "${aws_s3_bucket.sync.arn}"
            ],
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket"
            ]
        },
        {
            "Resource": [
                "${aws_s3_bucket.sync.arn}/*"
            ],
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:PutObject"
            ]
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "read" {
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Resource": [
                "${aws_s3_bucket.sync.arn}"
            ],
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket"
            ]
        },
        {
            "Resource": [
                "${aws_s3_bucket.sync.arn}/*"
            ],
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ]
        }
    ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "sync" {
  policy_arn = aws_iam_policy.sync.arn
  user = aws_iam_user.sync.name
}

resource "aws_iam_user_policy_attachment" "read" {
  policy_arn = aws_iam_policy.read.arn
  user = aws_iam_user.reader.name
}