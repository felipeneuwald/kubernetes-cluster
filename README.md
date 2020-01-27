# kubernetes-cluster

# Table of Contents
1. [Overview](#Overview)
2. [Example2](#example2)
3. [Third Example](#third-example)
4. [Fourth Example](#fourth-examplehttpwwwfourthexamplecom)

## Overview

Deploys a fully-functional [Kubernetes](https://kubernetes.io/) Cluster in [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io) and [Ansible](https://www.ansible.com).

This is a work in progress.

![alt text](images/terraform_aws_ansible_flow.png "Logo Title Text 1")

## Requirements
- Terraform 0.12.17
- Ansible 2.9.1
- boto
- j2cli

-----------------------
$ pip3 install j2cli
< -- added as a requirement
* have to add pyyaml as a dependency for yaml files
* pip install j2cli[yaml] ----- could run this way too to install the dependency, but i didn't.
