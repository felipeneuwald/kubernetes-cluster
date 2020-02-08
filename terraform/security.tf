resource "aws_security_group" "kubernetes-cluster" {
  name        = "kubernetes-cluster"
  description = "kubernetes-cluster"
  vpc_id      = aws_vpc.kubernetes-cluster.id

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Self traffic"
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = [
      "0.0.0.0/0"
    ]
    description   = "Outbound traffic"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    description = "SSH"
  }

  tags = {
    Name        = "kubernetes-cluster"
    Project     = "kubernetes-cluster"
  }
}

resource "aws_security_group" "kube-apiserver" {
  name        = "kube-apiserver"
  description = "kube-apiserver"
  vpc_id      = aws_vpc.kubernetes-cluster.id

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Self traffic"
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = [
      "0.0.0.0/0"
    ]
    description   = "Outbound traffic"
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    description = "kube-apiserver"
  }

  tags = {
    Name        = "kube-apiserver"
    Project     = "kubernetes-cluster"
  }
}
