#!/bin/sh

# Set Region
REGION='us-east-2'

# Set parameter name where XRay daemon outputs its address
XRAY_IP_PARAM='default-cluster-xray-container'

# Digest SSM parameter from store

XRAY_IP=$(aws ssm get-parameters --name $XRAY_IP_PARAM --region $REGION --query 'Parameters[*].Value' --output text)

# TODO: Check for existing value in parameter
# aws ssm describe-parameters --region us-east-2 --query 'Parameters[?Name==`default-cluster-xray-container`]'# Digest SSM parameter from store

# Set XRay environment variables and and start Nodejs app

export AWS_XRAY_TRACING_NAME='nodejs-xray-discovery-test'
export AWS_XRAY_DAEMON_ADDRESS=$XRAY_IP

# Start nodejs app

npm start
