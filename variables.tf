variable "iam_user_name" {

  description = "IAM user name"

  type        = string

  default     = "shambhavi-readonly-user"

}

variable "s3_read_policy" {

  description = "S3 read-only IAM policy"

  type        = any

}


