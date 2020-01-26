#!/bin/sh

echo "### Building terraform/backend.tf..."
j2 -f yaml templates/backend.tf.j2 settings.yml -o terraform/backend.tf

echo "### Building terraform/terraform.tfvars..."
j2 -f yaml templates/terraform.tfvars.j2 settings.yml -o terraform/terraform.tfvars

echo "### Building ansible/ansible.cfg..."
j2 -f yaml templates/ansible.cfg.j2 settings.yml -o ansible/ansible.cfg

echo "### Building ansible/inventories/ec2.ini..."
j2 -f yaml templates/ec2.ini.j2 settings.yml -o ansible/inventories/ec2.ini
