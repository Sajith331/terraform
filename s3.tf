provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "app" {
  bucket = "my-tf-moba-bucket"
}
resource "aws_s3_bucket_ownership_controls" "one" {
bucket = aws_s3_bucket.app.id

rule {
object_ownership= "BucketOwnerPreferred"
}
}

resource "aws_s3_bucket_acl" "two" {
depends_on = [aws_s3_bucket_ownership_controls.one]
bucket= aws_s3_bucket.app.id
acl= "private"

}

resource "aws_s3_bucket_versioning" "three" {
bucket= aws_s3_bucket.app.id
versioning_configuration {
status = "Enabled"
}

}
