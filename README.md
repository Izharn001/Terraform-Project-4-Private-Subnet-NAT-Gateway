# Terraform Project 4 - Private Subnet & NAT Gateway Architecture

## Overview
This project extends modular Terraform infrastructure by implementing a more realistic AWS architecture using public and private subnets.
It introduces a private subnet with no direct internet access and uses a NAT Gateway to allow secure outbound connectivity.

## Modules

### VPC Module

* AWS VPC
* Public Subnet
* Private Subnet
* Internet Gateway
* NAT Gateway
* Route Tables (Public & Private)
* Route Table Associations

### EC2 Module

* Security Group (SSH access)
* EC2 Instance deployed in private subnet
* Dynamic AMI lookup using data source


## Architecture

* Public subnet hosts the Internet Gateway and NAT Gateway
* Private subnet contains the EC2 instance
* EC2 instance has no public IP (not directly accessible)
* Private subnet routes outbound traffic through the NAT Gateway
* Internet access flow:

EC2 (Private Subnet) → NAT Gateway → Internet Gateway → Internet


## Skills Practiced

* Advanced AWS networking (public vs private subnets)
* NAT Gateway configuration and routing
* Secure infrastructure design
* Terraform modules and reusable architecture
* Module inputs and outputs
* Dynamic configuration using data sources

## Outputs

* VPC ID
* Public Subnet ID
* Private Subnet ID
* EC2 Instance ID
* EC2 Private IP


## Challenges & Fixes

### Issue: Terraform state copied from previous project

* Copied `.terraform` and state files caused incorrect tracking of resources

### Fix:

* Deleted `.terraform` and state files
* Re-initialised Terraform using `terraform init`

### Lesson Learned:

* Each Terraform project must have its own clean state
* Never copy `.terraform` or `terraform.tfstate` between projects


## Improvements

* Add bastion host for secure SSH into private subnet
* Implement remote backend using S3 and DynamoDB
* Add load balancer for production setup
* Create environment separation (dev/prod)