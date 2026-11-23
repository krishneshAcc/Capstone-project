# Project 23 - IAM Role-Based S3 Access from EC2

## Objective
Configure an EC2 instance to access Amazon S3 securely using an IAM role instead of storing AWS access keys on the instance.

## Architecture
- Amazon EC2 (Amazon Linux 2023)
- IAM Role attached through an EC2 Instance Profile
- Amazon S3 bucket with versioning enabled
- AWS Systems Manager (SSM) for remote command execution
- Security Group with no inbound rules
- Least-privilege IAM permissions for the dedicated S3 bucket

## AWS Resources

| Resource | Name / ID |
|---|---|
| S3 Bucket | project23-iam-test-590507089733 |
| EC2 Instance | i-053e37a0240d773b4 |
| Instance Type | t3.micro |
| IAM Role | Project23-EC2-S3-Role-Krishnesh |
| Instance Profile | Project23-Krishnesh-Instance-Profile |
| Security Group | Project23-Dedicated-SG |
| Security Group ID | sg-0c8d60d6e631838e1 |
| Region | ap-south-1 (Mumbai) |

## IAM Configuration

### IAM Role
`Project23-EC2-S3-Role-Krishnesh`

The role trusts the EC2 service:

- Principal: `ec2.amazonaws.com`
- Action: `sts:AssumeRole`

### Attached Managed Policy
`AmazonSSMManagedInstanceCore`

This policy allows the EC2 instance to communicate with AWS Systems Manager.

### Custom Inline Policy
`Project23-Dedicated-S3-Access`

Permissions are restricted to the dedicated Project 23 bucket:

- `s3:ListBucket`
- `s3:GetObject`
- `s3:PutObject`

## Security Configuration

- No inbound Security Group rules
- SSH (port 22) is not exposed
- RDP (port 3389) is not exposed
- No EC2 key pair was used
- EC2 access and testing were performed using AWS Systems Manager
- IMDSv2 is required
- IAM permissions follow the least-privilege principle

## Testing and Validation

### 1. Systems Manager Connectivity
The EC2 instance was verified as Online in AWS Systems Manager.

### 2. IAM Role Authentication
The following command was executed remotely using SSM:

`aws sts get-caller-identity`

The returned identity was an assumed-role ARN:

`arn:aws:sts::590507089733:assumed-role/Project23-EC2-S3-Role-Krishnesh/i-053e37a0240d773b4`

### 3. S3 Listing
The EC2 instance successfully listed the dedicated S3 bucket.

### 4. S3 Upload
A test file named `project23-test.txt` was uploaded from the EC2 instance to the S3 bucket using the IAM role.

Upload destination:

`s3://project23-iam-test-590507089733/project23-test.txt`

### Test Results

| Test | Result |
|---|---|
| EC2 instance running | PASS |
| SSM connectivity | PASS |
| IAM role assumption | PASS |
| S3 bucket listing | PASS |
| S3 object upload | PASS |
| No inbound Security Group rules | PASS |
| Least-privilege S3 permissions | PASS |

## Conclusion

The EC2 instance successfully accessed Amazon S3 using its attached IAM role without requiring stored AWS credentials, SSH access, or inbound Security Group rules. The project demonstrates secure role-based access, Systems Manager remote management, and least-privilege IAM permissions.
