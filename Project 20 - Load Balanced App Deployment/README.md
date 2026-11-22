# Project 20 - Load Balanced App Deployment

## Objective
Improve application scalability and availability using an Application Load Balancer.

## Architecture
- Two EC2 web servers deployed in separate Availability Zones
- Internet-facing Application Load Balancer
- Target Group with HTTP health checks
- HTTP Listener on port 80

## EC2 Instances

### Server 1
- Availability Zone: ap-south-1a
- Instance ID: i-0f004b16ba3606e96

### Server 2
- Availability Zone: ap-south-1b
- Instance ID: i-07fba532af4994724

## Load Balancer
- Name: krishnesh-project20-alb
- Type: Application Load Balancer
- Scheme: Internet-facing
- DNS: krishnesh-project20-alb-773594024.ap-south-1.elb.amazonaws.com
- Listener: HTTP port 80

## Target Group
- Name: krishnesh-project20-tg
- Protocol: HTTP
- Port: 80
- Health Check Path: /
- Health Check Interval: 30 seconds

## Security
- ALB security group allows HTTP port 80 from the internet.
- EC2 security group allows HTTP port 80 only from the ALB security group.

## Validation
- Both EC2 targets reported healthy.
- 10 requests were sent through the ALB DNS.
- Requests were distributed between Server 1 and Server 2.
- Server 1 handled 5 requests.
- Server 2 handled 5 requests.

## Result
Successfully deployed a load-balanced web application using two EC2 instances across separate Availability Zones with health checks.
