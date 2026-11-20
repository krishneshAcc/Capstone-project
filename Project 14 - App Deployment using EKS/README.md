# Project 14 - App Deployment using EKS

## Goal
Deploy an application on Kubernetes using Amazon EKS and expose it publicly.

## Tasks Completed
- Verified the Amazon EKS cluster
- Connected to the EKS cluster using kubectl
- Verified worker nodes
- Deployed the application using Kubernetes Deployment
- Ran two application replicas
- Exposed the application publicly using a LoadBalancer Service
- Verified public HTTP access

## Infrastructure
- AWS Region: ap-south-1
- EKS Cluster: project14-eks
- Kubernetes Deployment: project14-webapp
- Replicas: 2
- Container Port: 80
- Service: project14-webapp-service
- Service Type: LoadBalancer

## Docker Image
590507089733.dkr.ecr.ap-south-1.amazonaws.com/project14-webapp:latest

## Public Application URL
http://aec34ed0f61094b30872b109224616a6-1079492166.ap-south-1.elb.amazonaws.com

## Verification
- Both application replicas were Running and Ready.
- The LoadBalancer received a public DNS name.
- Public HTTP request returned HTTP 200 OK.
- The application displayed the Project 14 deployment success page.

## Deliverable
Public access screenshot showing the application deployed on Amazon EKS.

## Status
Completed
