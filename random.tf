
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
    length = 32
    special = false
    upper = false
  
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}