# Create IAM user

resource "aws_iam_user" "s3_user" {

  name = var.iam_user_name

}



# Create IAM policy for S3 read-only

resource "aws_iam_policy" "s3_read_policy" {

  name        = "S3ReadOnlyCustomPolicy"

  description = "Read-only access to S3"



  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "s3:GetObject",

          "s3:ListBucket"

        ]

        Resource = "*"

      }

    ]

  })

}



# Attach policy to user

resource "aws_iam_user_policy_attachment" "attach_policy" {

  user       = aws_iam_user.s3_user.name

  policy_arn = aws_iam_policy.s3_read_policy.arn

}


