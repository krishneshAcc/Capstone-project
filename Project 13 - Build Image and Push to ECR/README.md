# Project 13 - Build Image and Push to ECR

## Goal
Publish an application Docker image to Amazon Elastic Container Registry (ECR).

## Tasks Completed
- Created and verified the ECR repository `project13-app`
- Built the Docker image
- Tagged the image for the ECR repository
- Authenticated Docker with Amazon ECR
- Pushed the Docker image to ECR
- Verified the `latest` image tag using AWS CLI

## Repository Details
- AWS Region: `ap-south-1`
- ECR Repository: `project13-app`
- Image Tag: `latest`

## Image URI
`590507089733.dkr.ecr.ap-south-1.amazonaws.com/project13-app:latest`

## Verification
The image was successfully pushed to ECR and verified using `aws ecr describe-images`.

## Status
Completed
