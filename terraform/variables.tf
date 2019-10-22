### reflects aws ireland, eu-west-1. Document.

variable "provider_region" {
  default = "eu-west-1"
}



variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}



variable "subnet-1_cidr_block" {
  default = "10.0.1.0/24"
}

variable "subnet-1_availability_zone" {
  default = "eu-west-1a"
}




variable "subnet-2_cidr_block" {
  default = "10.0.2.0/24"
}

variable "subnet-2_availability_zone" {
  default = "eu-west-1b"
}


variable "subnet-3_cidr_block" {
  default = "10.0.3.0/24"
}

variable "subnet-3_availability_zone" {
  default = "eu-west-1c"
}
