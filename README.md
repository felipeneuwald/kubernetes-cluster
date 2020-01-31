# kubernetes-cluster

# Table of Contents
1. [Overview](#Overview)
2. [Requirements](#Requirements)
3. [To-do list](#to-do-list)

# Overview

_kubernetes-cluster_ deploys a fully-functional [Kubernetes](https://kubernetes.io/) Cluster in [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io) for provisioning and [Ansible](https://www.ansible.com) for configuration management.

AWS resources are provisioned by Terraform. The Terraform state is stored in AWS S3. Ansible's external dynamic inventory system gathers hosts data from the state file stored in S3 and deploys the Kubernetes cluster in the compute instances.

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
- [ ] README.md
 - [ ] boto
 - [ ] fix the image
- [x] A way to have both Terraform and Ansible variables all in one configuration file
- [ ] Add a version.txt in the first version
- [ ] boto profiles
- [ ] Change tag "kubernetes-cluster" to a variable
- [ ] Add a bastion host
- Terraform
 - [ ] Compute: Support placement groups
 - [ ] Documentation, ebs_optimized = "true" | Error launching source instance: Unsupported: EBS-optimized instances are not supported for your requested configuration. Please check the documentation for supported configurations.
 - [ ] Documentation, Provider: Credentials are in ~/.aws
 - [ ] Provider: add "profile"?
 - [ ] VPC: Public and private subnets
 - [ ] Compute/EBS: additional options (like volume_type and iops) to root_block_device
 - [ ] Compute: set subnet_id besides availability_zone in instances
 - [ ] Documentation, AWS Region: Ireland, eu-west-1
 - [ ] Add support to other AWS regions
 - [ ] Remote state locking with DynamoDB
 - [ ] Documentation regarding S3 remote state & state locking with DynamoDB
 - [ ] Documentation: terraform.tfvars
 - [ ] Appropriate security group rules
 - [x] S3: Remote state
 - [x] fix backend.tf with static values
 - [ ] replace "master" by "control plane"
- Ansible
 -  [ ] Document dynamic inventory - [link1](https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html), [link2](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py), [link3](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini)
 - [ ] Enforce Kubernetes packages version
 - [ ] Packages marked as on hold are still being upgraded
 - [ ] Improve template, add a loop in etcd-kubeadmcfg.yaml.j2
 - [ ] Set "hostname_variable = tag_Name" in ec2.ini?
 - [ ] check notifies (probably wrong)
 - [ ] move "control_plane : apply Weave Net CNI plugin" shell command to a var set in defaults
 - [ ] allow the choice of other CNI plugins
