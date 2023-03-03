resource "aws_s3_bucket" "example" {
    # for_each = var.b-name
  bucket = var.bucketName
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name  = var.bucketName
    Owner = var.b-owner
  }
}


resource "aws_s3_bucket_acl" "site" {
  bucket = aws_s3_bucket.example.id
  acl = "public-read"
}

resource "aws_s3_bucket_policy" "example-policy" {
  bucket = aws_s3_bucket.example.id
  policy = templatefile("../bpolicy/policy.json", { bucket = var.bucketName })
}

resource "aws_s3_object" "example-index" {
  bucket = aws_s3_bucket.example.id
  key    = "index.html"
  source = "../template/index.html"
  acl    = "public-read"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.example.id
  key    = "error.html"
  source = "../template/error.html"
  acl    = "public-read"
}

resource "aws_route53_zone" "exampleDomain" {
  name = var.domainName
}

resource "aws_route53_record" "exampleDomain-a" {
  zone_id = aws_route53_zone.exampleDomain.zone_id
  name    = var.domainName
  type    = "A"
  alias {
    name                   = aws_s3_bucket.example.website_endpoint
    zone_id                = aws_s3_bucket.example.hosted_zone_id
    evaluate_target_health = true
  }
}

