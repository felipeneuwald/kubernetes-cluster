resource "aws_instance" "master-a" {
  ami               = var.master_instance_ami
  instance_type     = var.master_instance_type
  subnet_id         = aws_subnet.subnet-a.id
  ebs_optimized     = var.master_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.master_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "master-a"
    Type            = "master"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.master_root_block_device_volume_size
  }
}

resource "aws_instance" "master-b" {
  ami               = var.master_instance_ami
  instance_type     = var.master_instance_type
  subnet_id         = aws_subnet.subnet-b.id
  ebs_optimized     = var.master_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.master_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "master-b"
    Type            = "master"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.master_root_block_device_volume_size
  }
}

resource "aws_instance" "master-c" {
  ami               = var.master_instance_ami
  instance_type     = var.master_instance_type
  subnet_id         = aws_subnet.subnet-c.id
  ebs_optimized     = var.master_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.master_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "master-c"
    Type            = "master"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.master_root_block_device_volume_size
  }
}

resource "aws_instance" "etcd-a" {
  ami               = var.etcd_instance_ami
  instance_type     = var.etcd_instance_type
  subnet_id         = aws_subnet.subnet-a.id
  ebs_optimized     = var.etcd_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.etcd_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "etcd-a"
    Type            = "etcd"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.master_root_block_device_volume_size
  }
}

resource "aws_instance" "etcd-b" {
  ami               = var.etcd_instance_ami
  instance_type     = var.etcd_instance_type
  subnet_id         = aws_subnet.subnet-b.id
  ebs_optimized     = var.etcd_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.etcd_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "etcd-b"
    Type            = "etcd"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.master_root_block_device_volume_size
  }
}

resource "aws_instance" "etcd-c" {
  ami               = var.etcd_instance_ami
  instance_type     = var.etcd_instance_type
  subnet_id         = aws_subnet.subnet-c.id
  ebs_optimized     = var.etcd_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.etcd_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "etcd-c"
    Type            = "etcd"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.master_root_block_device_volume_size
  }
}

resource "aws_instance" "worker-a" {
  count             = var.worker_nodes_per_az
  ami               = var.worker_instance_ami
  instance_type     = var.worker_instance_type
  subnet_id         = aws_subnet.subnet-a.id
  ebs_optimized     = var.worker_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.worker_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "worker-a-${count.index}"
    Type            = "worker"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.worker_root_block_device_volume_size
  }
}

resource "aws_instance" "worker-b" {
  count             = var.worker_nodes_per_az
  ami               = var.worker_instance_ami
  instance_type     = var.worker_instance_type
  subnet_id         = aws_subnet.subnet-b.id
  ebs_optimized     = var.worker_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.worker_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "worker-b-${count.index}"
    Type            = "worker"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.worker_root_block_device_volume_size
  }
}

resource "aws_instance" "worker-c" {
  count             = var.worker_nodes_per_az
  ami               = var.worker_instance_ami
  instance_type     = var.worker_instance_type
  subnet_id         = aws_subnet.subnet-c.id
  ebs_optimized     = var.worker_ebs_optimized
  key_name          = var.key_name
  monitoring        = var.worker_monitoring
  vpc_security_group_ids = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  tags   = {
    Name            = "worker-c-${count.index}"
    Type            = "worker"
    Project         = "kubernetes-cluster"
  }
  root_block_device {
    volume_size     = var.worker_root_block_device_volume_size
  }
}
