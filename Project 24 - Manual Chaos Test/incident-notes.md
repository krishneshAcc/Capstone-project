# Project 24 - Manual Chaos Test

## Objective
Record the recovery process after intentionally stopping a service.

## Service Tested
- Service: Nginx
- Service name: nginx.service
- Environment: Ubuntu Linux VM

## Baseline
- Nginx was initially running.
- HTTP connectivity to localhost was successful.
- HTTP response: 200 OK.
- Nginx was listening on port 80.

## Failure Simulation
- Action: Intentionally stopped the Nginx service.
- Command: `sudo systemctl stop nginx`
- Result: Service became inactive (dead).
- HTTP verification: Failed.
- Error: `Couldn't connect to server` on localhost port 80.

## Recovery
- Action: Restarted the Nginx service.
- Command: `sudo systemctl start nginx`

## Recovery Verification
- Service status: Active (running).
- HTTP verification: Successful.
- Expected response: HTTP 200 OK.

## Incident Summary
Nginx was intentionally stopped to simulate a service outage. The outage was confirmed by checking the service status and attempting to access localhost over HTTP. The service was then restarted and its status and HTTP connectivity were verified to confirm successful recovery.

## Conclusion
The manual chaos test successfully demonstrated service failure detection and recovery using systemd service management and HTTP verification.
