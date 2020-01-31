# kubernetes-cluster

# Table of Contents
1. [Overview](#Overview)
2. [Requirements](#Requirements)
3. [To-do list](#to-do-list)

# Overview

_kubernetes-cluster_ deploys a fully-functional [Kubernetes](https://kubernetes.io/) Cluster in [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io) for provisioning and [Ansible](https://www.ansible.com) for configuration management.

AWS resources are provisioned by Terraform. Terraform state file is stored in AWS S3. Ansible's external dynamic inventory system gathers hosts data from the state file stored in S3 and deploys the Kubernetes cluster in the compute instances.

![alt text](images/terraform_aws_ansible_flow.png "Logo Title Text 1")

The Kubernetes cluster is composed by:
- Three etcd nodes
- Three Control Plane nodes
- At least three Worker nodes

The cluster is built taking into consideration AWS's high availability features. All nodes are distributed equally among three Availability Zones of a single region.

For simplicity and easy management purpose, _kubernetes-cluster_ uses a single [YAML](https://yaml.org/) configuration file to set all variables. A shell script calls [j2cli](https://github.com/kolypto/j2cli) which builds Terraform and Ansible configuration files based on [Jinja2](https://jinja.palletsprojects.com/) templates, fetching variables from that single configuration file.

# Requirements
- Terraform 0.12.17
- Ansible 2.9.1
- boto
- j2cli

# To-do list
- [ ] README.md :: boto
- [ ] README.md :: Document Ansible Dynamic Inventory - [link1](https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html), [link2](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py), [link3](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini)
- [ ] Add boto profiles support
- [ ] version.txt
- [ ] Replace the tag "kubernetes-cluster" by a variable
- [ ] boto profiles
- [ ] Add a bastion host
- [ ] Replace "master" by "control plane" (?)

- [ ] Terraform :: support placement groups
- [ ] Terraform :: ebs_optimized = true | _Error launching source instance: Unsupported: EBS-optimized instances are not supported for your requested configuration. Please check the documentation for supported configurations._
- [ ] Terraform :: Add public and private subnets. Move the cluster to a private subnet
- [ ] Terraform :: VPC, public and private subnets
- [ ] Terraform :: Compute/EBS additional options, like volume_type and IOPS to root_block_device
- [ ] Terraform :: Compute, set subnet_id instead availability_zone in instances
- [ ] Terraform :: Remote state locking with DynamoDB
- [ ] Terraform :: Appropriate Security Group rules

- [ ] Ansible :: Enforce Kubernetes packages version
- Ansible
- [ ] Ansible :: Enforce Kubernetes packages version
- [ ] Ansible :: Packages marked as on hold are still being upgraded (double-check if this is happening and fix it)
- [ ] Ansible :: Double-check if the _notifies_ are in the right place, order.
- [ ] Ansible :: Move _control_plane : apply Weave Net CNI plugin_ shell command to a variable
- [ ] Allow the choice of other CNI plugins (?)
