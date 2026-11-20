# Project 16 - Enable HTTPS using ACM

## Goal
Secure web access.

## Tasks
- Setup ALB + HTTPS listener
- Block HTTP

## Work Completed
- Used the existing Application Load Balancer: `p16-alb`.
- Configured HTTPS listener on port 443.
- HTTPS listener forwards traffic to `p16-target-group`.
- Configured HTTP listener on port 80 to return a fixed response (403).
- HTTP requests display: `HTTP traffic blocked`.

## AWS Resources
- Region: ap-south-1 (Mumbai)
- ALB: p16-alb
- Target Group: p16-target-group
- HTTPS Listener: Port 443
- HTTP Listener: Port 80

## Testing Results
- HTTP: Successfully blocked with fixed response `HTTP traffic blocked`.
- HTTPS: Listener responds, but backend returns 502 Bad Gateway because the target EC2 instance is unhealthy.
- Certificate: Self-signed certificate; browser displays a certificate trust warning.

## Status
ALB, HTTPS listener, and HTTP blocking configuration completed.
Backend health and trusted certificate validation remain limitations.
