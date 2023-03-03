module "s3_bucket" {
  source = "../s3resorce"
  for_each = var.elements
  # b-name = each.value.name
  b-owner = each.value.b-Owner
  domainName = each.value.domainName
  bucketName = each.value.bucketName
}