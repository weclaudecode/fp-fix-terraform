module "logs" {
  source = "../../modules/bucket"
  name   = "fp-fix-prod-logs"
}

# Planted: a root-level bucket with no versioning and no public access block.
resource "aws_s3_bucket" "assets" {
  bucket = "fp-fix-prod-assets"
}

# Planted: a queue with no customer-managed key, and a log group with no retention.
resource "aws_sqs_queue" "jobs" {
  name                    = "fp-fix-prod-jobs"
  sqs_managed_sse_enabled = false
}

resource "aws_cloudwatch_log_group" "app" {
  name = "/fp-fix/prod/app"
}
