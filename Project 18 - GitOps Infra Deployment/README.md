# Project 18 - GitOps Infrastructure Deployment

## Objective
Implement GitOps-style infrastructure deployment by triggering Terraform apply operations through GitHub Actions with manual approval.

## Tasks Completed
- Configured Terraform Apply workflow
- Implemented GitHub Actions workflow
- Configured deployment environment
- Added required reviewer approval
- Enabled manual approval before Terraform Apply
- Verified workflow pauses for approval
- Approved deployment through GitHub Actions

## Approval Configuration
Environment: project18-approval

Required Reviewer: krishneshAcc

Prevent Self-Review: Disabled

## Workflow
The GitHub Actions workflow is located at:

.github/workflows/project18-gitops-apply.yml

## Evidence
Screenshots demonstrate:
1. GitHub Actions workflow execution
2. Workflow waiting for approval
3. Review pending deployments
4. Approval and deployment process
5. Successful Terraform Apply

## Result
GitOps infrastructure deployment workflow with manual approval was successfully configured and tested.
