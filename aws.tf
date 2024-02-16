
provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}