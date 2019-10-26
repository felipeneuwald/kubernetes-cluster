variable "backend_s3_bucket" {}
variable "backend_s3_key" {}
variable "backend_s3_region" {}

variable "provider_region" {}

variable "vpc_cidr_block" {}
variable "subnet-a_cidr_block" {}
variable "subnet-a_availability_zone" {}
variable "subnet-b_cidr_block" {}
variable "subnet-b_availability_zone" {}
variable "subnet-c_cidr_block" {}
variable "subnet-c_availability_zone" {}

variable "key_name" {}
variable "public_key" {}

variable "master_instance_ami" {}
variable "master_instance_type" {}
variable "master_ebs_optimized" {}
variable "master_monitoring" {}
variable "master_root_block_device_volume_size" {}

variable "worker_nodes_per_az" {}
variable "worker_instance_ami" {}
variable "worker_instance_type" {}
variable "worker_ebs_optimized" {}
variable "worker_monitoring" {}
variable "worker_root_block_device_volume_size" {}
