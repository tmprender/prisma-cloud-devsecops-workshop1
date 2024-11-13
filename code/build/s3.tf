provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "8335259d-3c8b-4ed1-b8a4-9271e7f9222d"
    git_commit           = "2a0adb904d9af0540d8a118dc16c715b2e1a10ff"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-11-13 17:46:13"
    git_last_modified_by = "tmprender@gmail.com"
    git_modifiers        = "tmprender"
    git_org              = "tmprender"
    git_repo             = "prisma-cloud-devsecops-workshop1"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
