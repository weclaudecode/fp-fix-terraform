module "logs" {
  source = "../../modules/bucket"
  name   = "fp-fix-dev-logs"
}

# Versioning is set here, not in modules/bucket, because envs/prod shares the module.
resource "aws_s3_bucket_versioning" "logs" {
  bucket = element(split(":::", module.logs.arn), 1)

  versioning_configuration {
    status = "Enabled"
  }
}

# Planted: SSH open to the internet.
resource "aws_security_group" "admin" {
  name        = "fp-fix-dev-admin"
  description = "Admin access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Planted: an unencrypted volume.
resource "aws_ebs_volume" "data" {
  availability_zone = "ap-southeast-2a"
  size              = 8
  encrypted         = false
}
