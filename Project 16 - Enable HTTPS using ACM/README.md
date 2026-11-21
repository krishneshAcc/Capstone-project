# Project 16 - Enable HTTPS using ACM

## Project Overview

This project demonstrates how to enable HTTPS for a web application hosted on an Amazon EC2 instance using an Application Load Balancer (ALB) and AWS Certificate Manager (ACM).

The web server is hosted on an EC2 instance running Amazon Linux 2023 with Nginx. The Application Load Balancer distributes incoming traffic and provides HTTPS access using an SSL/TLS certificate imported into ACM.

HTTP traffic is restricted, while HTTPS traffic is allowed to reach the application.

## Architecture

Internet
   |
   v
Application Load Balancer (Internet-Facing)
   |
   |-- HTTP Listener (Port 80)
   |       |
   |       +-- Returns HTTP 403 Forbidden
   |
   |-- HTTPS Listener (Port 443)
           |
           +-- ACM Certificate
           |
           v
       Target Group (HTTP Port 80)
           |
           v
       EC2 Instance
           |
           v
       Nginx Web Server

## AWS Services Used

- Amazon EC2
- Amazon Linux 2023
- Application Load Balancer (ALB)
- Elastic Load Balancing Target Group
- AWS Certificate Manager (ACM)
- Amazon VPC
- Security Groups
- Nginx

## Infrastructure Details

### EC2 Instance

- Operating System: Amazon Linux 2023
- Instance Type: t3.micro
- Web Server: Nginx
- Application Port: 80

### Application Load Balancer

- Type: Application Load Balancer
- Scheme: Internet-facing
- Availability Zones: Two Availability Zones
- HTTP Listener: Port 80
- HTTPS Listener: Port 443

### Target Group

- Protocol: HTTP
- Port: 80
- Target Type: Instance
- Health Check Path: /
- Health Check Protocol: HTTP

## Security Configuration

### ALB Security Group

Inbound Rules:

| Protocol | Port | Source |
|---|---:|---|
| HTTP | 80 | 0.0.0.0/0 |
| HTTPS | 443 | 0.0.0.0/0 |

Outbound Rules:

| Protocol | Destination |
|---|---|
| All Traffic | 0.0.0.0/0 |

### EC2 Security Group

Inbound Rules:

| Protocol | Port | Source |
|---|---:|---|
| HTTP | 80 | ALB Security Group |

SSH access is not enabled in the EC2 security group.

Outbound traffic is allowed for server updates and required operations.

## SSL/TLS Certificate

A self-signed SSL certificate was generated using OpenSSL and imported into AWS Certificate Manager.

The certificate was configured with the Application Load Balancer DNS name as the Common Name and Subject Alternative Name.

Certificate validity: 365 days.

The certificate was attached to the HTTPS listener on port 443.

Note: Because this is a self-signed certificate, browsers may display a security warning. HTTPS was tested using curl with the -k option to bypass certificate trust validation during testing.

## Listener Configuration

### HTTP Listener - Port 80

HTTP requests return a fixed response:

- Status Code: 403 Forbidden
- Message: HTTP traffic blocked - use HTTPS

HTTP requests are not forwarded to the application.

### HTTPS Listener - Port 443

- Protocol: HTTPS
- SSL/TLS Certificate: ACM imported certificate
- Traffic forwarded to Target Group
- Target Group forwards traffic to Nginx on EC2 using HTTP port 80

## Application

The Nginx web server serves the following page:

Project 16 - HTTPS using ACM

Nginx Server Successfully Installed!

## Verification and Testing

### Target Group Health

The EC2 target was successfully registered and its health status became:

- Healthy

### HTTP Test

HTTP was tested using curl.

Expected result:

- HTTP 403 Forbidden
- HTTP traffic blocked - use HTTPS

### HTTPS Test

HTTPS was tested using curl with the -k option.

Expected result:

- HTTP 200 OK
- Application webpage successfully returned

### Browser Test

The HTTPS URL was opened successfully in a browser, and the application webpage was displayed.

## Project Outcome

Successfully configured an internet-facing Application Load Balancer with HTTPS using an ACM-imported self-signed certificate.

The project demonstrates:

- EC2 web server deployment
- Nginx installation and configuration
- Application Load Balancer setup
- Target Group registration and health checks
- Security Group configuration
- SSL/TLS certificate generation
- ACM certificate import
- HTTPS listener configuration
- HTTP restriction using a fixed 403 response
- HTTPS connectivity verification

## Security Note

The private key used for the self-signed certificate must not be committed to GitHub.

Certificate private-key files and sensitive credentials are excluded from this repository.

