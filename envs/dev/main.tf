module "logs" {
  source = "../../modules/bucket"
  name   = "fp-fix-dev-logs"
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
