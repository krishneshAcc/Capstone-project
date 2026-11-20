# Project 15 - Automate Server Configuration with Ansible

## Goal
Automate server configuration using Ansible.

## Tasks Completed
- Installed Ansible on the Linux VM
- Configured Ansible controller inventory
- Created an Ansible playbook
- Automated Nginx installation
- Started and enabled Nginx
- Deployed a custom HTML webpage
- Verified the webpage using curl
- Verified Nginx service status

## Environment
- Ansible Version: 2.16.3
- Controller: Linux VM
- Target: localhost
- Connection: Local
- Web Server: Nginx

## Files
- `inventory.ini` - Ansible inventory
- `install_nginx.yml` - Playbook for Nginx installation and configuration

## Verification
The Ansible playbook completed successfully with:
- Failed: 0
- Unreachable: 0

Nginx was verified as active and running, and the custom webpage was successfully retrieved using curl.

## Limitation
This project was performed using localhost as the target because only one VM was available. Remote configuration of a separate server was not demonstrated.

## Status
Completed
