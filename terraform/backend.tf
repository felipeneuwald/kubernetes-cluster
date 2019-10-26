terraform {
  backend "s3" {
    bucket = "felipeneuwald-kubernetes-cluster"
    key    = "kubernetes-cluster/terraform"
    region = "eu-west-1"
  }
}
