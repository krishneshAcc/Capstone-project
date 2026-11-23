# Project 21 - CloudWatch Monitoring Dashboard

## Objective
Create an Amazon CloudWatch dashboard to visualize and monitor EC2 performance metrics.

## AWS Services Used
- Amazon CloudWatch
- Amazon EC2

## Dashboard Details
- Dashboard Name: `Project21-Monitoring-Dashboard`
- AWS Region: `ap-south-1` (Mumbai)

## Monitored Instances

| Instance | Instance ID |
|---|---|
| Project 21 Webserver | `i-0841d7a89c45068d1` |
| Project 20 EC2-1 | `i-0037c470ac0393c65` |

## Dashboard Widgets

1. **EC2 CPU Utilization** – Compares CPU utilization of both EC2 instances.
2. **Network In** – Monitors incoming network traffic.
3. **Network Out** – Monitors outgoing network traffic.
4. **EC2 Status Checks** – Monitors EC2 instance status check failures.

## Configuration
The file `project21-dashboard.json` contains the CloudWatch dashboard configuration.

## Deployment

Validate the dashboard JSON:

```bash
python3 -m json.tool project21-dashboard.json
