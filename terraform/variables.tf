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

variable "etcd_instance_ami" {}
variable "etcd_instance_type" {}
variable "etcd_ebs_optimized" {}
variable "etcd_monitoring" {}
variable "etcd_root_block_device_volume_size" {}

variable "worker_nodes_per_az" {}
variable "worker_instance_ami" {}
variable "worker_instance_type" {}
variable "worker_ebs_optimized" {}
variable "worker_monitoring" {}
variable "worker_root_block_device_volume_size" {}

variable "lb_kube-apiserver_idle_timeout" {}
variable "lb_kube-apiserver_connection_draining" {}
variable "lb_kube-apiserver_connection_draining_timeout" {}
variable "lb_kube-apiserver_instance_port" {}
variable "lb_kube-apiserver_lb_port" {}
variable "lb_kube-apiserver_health_check_healthy_threshold" {}
variable "lb_kube-apiserver_health_check_unhealthy_threshold" {}
variable "lb_kube-apiserver_health_check_timeout" {}
variable "lb_kube-apiserver_health_check_interval" {}
