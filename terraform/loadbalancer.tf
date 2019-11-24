resource "aws_elb" "kube-apiserver" {
  name                        = "kube-apiserver"
  internal                    = true
  cross_zone_load_balancing   = true
  idle_timeout                = 60
  connection_draining         = true
  connection_draining_timeout = 300
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
    instance_port             = 6443
    instance_protocol         = "TCP"
    lb_port                   = 6443
    lb_protocol               = "TCP"
  }
  health_check {
    healthy_threshold         = 6
    unhealthy_threshold       = 3
    timeout                   = 2
    target                    = "TCP:6443"
    interval                  = 10
  }
  tags                        = {
    Name                      = "kube-apiserver"
    Project                   = "kubernetes-cluster"
  }
}
