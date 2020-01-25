#!/bin/sh

echo "### Building terraform/terraform.tfvars..."
j2 -f yaml templates/terraform.tfvars.j2 settings.yml -o terraform/terraform.tfvars
