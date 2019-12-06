### Backend
backend_s3_bucket                                  = "felipeneuwald-kubernetes-cluster"
backend_s3_key                                     = "kubernetes-cluster/terraform"
backend_s3_region                                  = "eu-west-1"

### Provider
provider_region                                    = "eu-west-1"

### Key
key_name                                           = "kubernetes-cluster"
public_key                                         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDY4UiC2rYhxwFP9FzHa6kqXn1q4D/OGIWg72sFVg2oyJgHK1u//xaon9qNV0BQRbIeXWgT5WkGQP+4TKxHmPpy43/Py8r+OMWQgx+WuFa1ocPEngQZu52/KPgHfDT234P/qWwefrBW2x2Z4A+EnVkz2ChSXmNRLgm2VEqKNKPJdW06tH+zBUm7YD/60KzDW2RzQTfiZ/wJl031/yrHgyOy1RkiAtmnnphiO10dj3cX3Nzb+raOYjx5Qx5glqnVN4qJJfCUn2OtvR2Ll11XLh7FesLDg5Usd9C6MCDPbQXZ6qO/B5cDKcmW26pxASKFuDeUvZwcSsTLJqsSeHpo/Lbh kubernetes-cluster"

### Network
vpc_cidr_block                                     = "10.0.0.0/16"
subnet-a_cidr_block                                = "10.0.1.0/24"
subnet-a_availability_zone                         = "eu-west-1a"
subnet-b_cidr_block                                = "10.0.2.0/24"
subnet-b_availability_zone                         = "eu-west-1b"
subnet-c_cidr_block                                = "10.0.3.0/24"
subnet-c_availability_zone                         = "eu-west-1c"

### Master nodes
master_instance_ami                                = "ami-02df9ea15c1778c9c"
master_instance_type                               = "t3a.small"
master_monitoring                                  = "false"
master_ebs_optimized                               = "false"
master_root_block_device_volume_size               = "10"

### etcd nodes
etcd_instance_ami                                  = "ami-02df9ea15c1778c9c"
etcd_instance_type                                 = "t3a.small"
etcd_monitoring                                    = "false"
etcd_ebs_optimized                                 = "false"
etcd_root_block_device_volume_size                 = "10"

### Worker nodes
worker_nodes_per_az                                = "1"
worker_instance_ami                                = "ami-02df9ea15c1778c9c"
worker_instance_type                               = "t3a.small"
worker_monitoring                                  = "false"
worker_ebs_optimized                               = "false"
worker_root_block_device_volume_size               = "10"

### Load Balancer, kube-apiserver
lb_kube-apiserver_idle_timeout                     = "60"
lb_kube-apiserver_connection_draining              = "true"
lb_kube-apiserver_connection_draining_timeout      = "300"
lb_kube-apiserver_instance_port                    = "6443"
lb_kube-apiserver_lb_port                          = "6443"
lb_kube-apiserver_health_check_healthy_threshold   = "6"
lb_kube-apiserver_health_check_unhealthy_threshold = "3"
lb_kube-apiserver_health_check_timeout             = "2"
lb_kube-apiserver_health_check_interval            = "10"
