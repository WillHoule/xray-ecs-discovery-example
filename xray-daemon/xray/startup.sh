#!/usr/bin/env bash

XRAY_PARAM_NAME='default-cluster-xray-container'

# Sets region
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F \" '{print $4}')

# set the SSM Parameter store value for container's ip in the Docker0 bridge network
aws ssm put-parameter --name XRAY_PARAM_NAME --type String --value $(hostname -i) --overwrite --region $REGION

exec "$@"