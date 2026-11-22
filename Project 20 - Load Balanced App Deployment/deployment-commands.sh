#!/bin/bash

# Project 20 - Load Balanced App Deployment
# Reference record of AWS CLI deployment commands.
# Infrastructure is already deployed. Do not rerun blindly.

# Region
aws configure get region

# EC2 Instances
# Server 1: i-0f004b16ba3606e96
# AZ: ap-south-1a
# Server 2: i-07fba532af4994724
# AZ: ap-south-1b

# ALB Security Group
# sg-0d87f742ccbd25013
# HTTP port 80 from 0.0.0.0/0

# EC2 Security Group
# sg-0b2d764af18a3ffb1
# HTTP port 80 from ALB security group only

# Target Group
# Name: krishnesh-project20-tg
# ARN:
# arn:aws:elasticloadbalancing:ap-south-1:590507089733:targetgroup/krishnesh-project20-tg/e3370a9bb21fc709

# Load Balancer
# Name: krishnesh-project20-alb
# DNS:
# krishnesh-project20-alb-773594024.ap-south-1.elb.amazonaws.com

# Listener
# HTTP port 80 forwarding to the Project 20 Target Group

# Verify Target Health
aws elbv2 describe-target-health \
  --target-group-arn arn:aws:elasticloadbalancing:ap-south-1:590507089733:targetgroup/krishnesh-project20-tg/e3370a9bb21fc709 \
  --query "TargetHealthDescriptions[].[Target.Id,TargetHealth.State]" \
  --output table

# Test Load Balancing
for i in {1..10}; do
  echo "Request $i:"
  curl -s http://krishnesh-project20-alb-773594024.ap-south-1.elb.amazonaws.com | grep -E "SERVER 1|SERVER 2"
  echo "-----------------------------"
done
