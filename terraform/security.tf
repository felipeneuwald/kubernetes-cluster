resource "aws_security_group" "kubernetes-cluster" {
  name        = "kubernetes-cluster"
  description = "kubernetes-cluster"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    description = "SSH"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    description = "Outbound traffic"
  }
}
