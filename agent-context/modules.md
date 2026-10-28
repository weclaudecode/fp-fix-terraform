# Modules

| Folder | Owns | Key files | Names |
|---|---|---|---|
| `modules/bucket` | An S3 bucket, shared by both roots | `modules/bucket/main.tf` | input `name`; output `arn`; resource `aws_s3_bucket.this`. No versioning, public access block or logging. |
| `envs/dev` | Dev root | `envs/dev/main.tf` | `module.logs`, `aws_security_group.admin` (SSH open to 0.0.0.0/0), `aws_ebs_volume.data` (unencrypted) |
| `envs/prod` | Prod root | `envs/prod/main.tf` | `module.logs`, `aws_s3_bucket.assets`, `aws_sqs_queue.jobs` (SSE off), `aws_cloudwatch_log_group.app` (no retention) |
<!-- source: modules/bucket/main.tf · 6c48b22 · by analyst -->
