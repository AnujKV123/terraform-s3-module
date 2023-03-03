output "b-name-from-s3" {
  value = compact(aws_s3_bucket.example[*].bucket)
}

output "b-name-from-s3-acl" {
  value = compact(aws_s3_bucket.example[*].acl)
}

output "b-name-from-s3-id" {
  value = compact(aws_s3_bucket.example[*].id)
}

