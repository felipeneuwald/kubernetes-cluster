resource "aws_elb" "kube-apiserver" {
  name                        = "kube-apiserver"
  internal                    = true
  cross_zone_load_balancing   = true
  idle_timeout                = var.lb_kube-apiserver_idle_timeout
  connection_draining         = var.lb_kube-apiserver_connection_draining
  connection_draining_timeout = var.lb_kube-apiserver_connection_draining_timeout
  subnets                     = [
    "${aws_subnet.subnet-a.id}",
    "${aws_subnet.subnet-b.id}",
    "${aws_subnet.subnet-c.id}"
  ]
  security_groups             = [
    "${aws_security_group.kubernetes-cluster.id}"
  ]
  instances                   = [
    "${aws_instance.master-a.id}",
    "${aws_instance.master-b.id}",
    "${aws_instance.master-c.id}"
  ]
  listener {
    instance_port             = var.lb_kube-apiserver_instance_port
    instance_protocol         = "TCP"
    lb_port                   = var.lb_kube-apiserver_lb_port
    lb_protocol               = "TCP"
  }
  health_check {
    healthy_threshold         = var.lb_kube-apiserver_health_check_healthy_threshold
    unhealthy_threshold       = var.lb_kube-apiserver_health_check_unhealthy_threshold
    timeout                   = var.lb_kube-apiserver_health_check_timeout
    target                    = "TCP:${var.lb_kube-apiserver_instance_port}"
    interval                  = var.lb_kube-apiserver_health_check_interval
  }
  tags                        = {
    Name                      = "kube-apiserver"
    Project                   = "kubernetes-cluster"
  }
}
