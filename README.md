# Terraform Project 3 - Modular AWS Infrastructure

## Overview
This project refactors AWS infrastructure into reusable Terraform modules. It separates networking and compute resources into dedicated modules and connects them using module inputs and outputs.

## Modules
- VPC module
  - VPC
  - Public subnet
  - Internet gateway
  - Route table and association

- EC2 module
  - Security group
  - EC2 instance
  - Dynamic AMI lookup using data source

## Architecture
- Root module calls the VPC and EC2 modules
- The VPC module outputs the VPC ID and subnet ID
- The EC2 module consumes those values as inputs
- EC2 is deployed into the subnet created by the VPC module

## Skills Practiced
- Terraform modules
- Module inputs and outputs
- Reusable infrastructure design
- Resource dependency management
- Dynamic AMI lookup with data sources
- Debugging module and configuration issues

## Challenges & Fixes
- Issue: Module not installed
  - Terraform could not recognise the newly added EC2 module
- Fix:
  - Ran terraform init after adding the module
- Lesson Learned:
  - Terraform must initialise modules before they can be used

## Improvements
- Add private subnet and NAT Gateway
- Implement remote backend using S3 and DynamoDB
- Add environment separation (dev/prod)
- Expand modules for greater reuse