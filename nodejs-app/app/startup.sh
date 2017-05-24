#!/bin/sh

# Set Region
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F \" '{print $4}')

# Set parameter name where XRay daemon outputs its address
XRAY_PARAM_NAME='default-cluster-xray-container'

# Digest SSM parameter from store

XRAY_IP=$(aws ssm get-parameters --name $XRAY_PARAM_NAME --region $REGION --query 'Parameters[*].Value' --output text)

# TODO: Check for existing value in parameter
# aws ssm describe-parameters --region us-east-2 --query 'Parameters[?Name==`default-cluster-xray-container`]'# Digest SSM parameter from store

# Set XRay environment variables and and start Nodejs app

export AWS_XRAY_TRACING_NAME='nodejs-xray-discovery-test'
export AWS_XRAY_DAEMON_ADDRESS=$XRAY_IP

# Start nodejs app

npm start
