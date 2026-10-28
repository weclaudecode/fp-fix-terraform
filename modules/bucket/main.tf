# A shared bucket module, used by both roots (envs/dev and envs/prod).
# Planted: no versioning, no public access block, no access logging.
variable "name" {
  type = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.name
}

output "arn" {
  value = aws_s3_bucket.this.arn
}
