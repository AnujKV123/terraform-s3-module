output "b_name" {
  value = toset([for bucket in module.s3_bucket:bucket])
}

output "b_acl" {
  value = toset([for acl in module.s3_bucket:acl])
}

output "s3_id" {
  value = toset([for id in module.s3_bucket:id])
}

