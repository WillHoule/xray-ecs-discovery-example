#!/bin/sh

# set the SSM Parameter store value for container's ip in the Docker0 bridge network
aws ssm put-parameter --name default-cluster-xray-container --type String --value $(hostname -i) --overwrite --region us-east-2

# Start xray daemon
/usr/bin/xray --bind=0.0.0.0:2000
