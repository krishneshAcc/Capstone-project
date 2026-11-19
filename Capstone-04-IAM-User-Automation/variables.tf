variable "user_name" {
  default = "terraform-s3-user-krishnesh"
}

variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
