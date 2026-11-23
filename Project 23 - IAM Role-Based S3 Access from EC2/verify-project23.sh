#!/bin/bash

set -e

REGION="ap-south-1"
INSTANCE_ID="i-053e37a0240d773b4"
ROLE_NAME="Project23-EC2-S3-Role-Krishnesh"
BUCKET="project23-iam-test-590507089733"
SG_ID="sg-0c8d60d6e631838e1"

echo "========================================"
echo " PROJECT 23 VERIFICATION"
echo "========================================"

echo
echo "[1] EC2 INSTANCE STATUS"
aws ec2 describe-instances \
  --region "$REGION" \
  --instance-ids "$INSTANCE_ID" \
  --query 'Reservations[0].Instances[0].State.Name' \
  --output text

echo
echo "[2] SSM CONNECTION STATUS"
aws ssm describe-instance-information \
  --region "$REGION" \
  --filters "Key=InstanceIds,Values=$INSTANCE_ID" \
  --query 'InstanceInformationList[0].PingStatus' \
  --output text

echo
echo "[3] SECURITY GROUP INBOUND RULES"
aws ec2 describe-security-groups \
  --region "$REGION" \
  --group-ids "$SG_ID" \
  --query 'SecurityGroups[0].IpPermissions' \
  --output json

echo
echo "[4] IAM ROLE INLINE POLICIES"
aws iam list-role-policies \
  --role-name "$ROLE_NAME" \
  --output table

echo
echo "[5] S3 BUCKET VERSIONING"
aws s3api get-bucket-versioning \
  --bucket "$BUCKET" \
  --query 'Status' \
  --output text

echo
echo "[6] S3 TEST OBJECT"
aws s3 ls "s3://$BUCKET/"

echo
echo "========================================"
echo " VERIFICATION COMPLETE"
echo "========================================"
