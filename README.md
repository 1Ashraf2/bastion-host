A Website Project on the AWS using Terraform:
In this project I am using Terraform environments and reusable modules to avoid duplication of resources, so changes can be made only in one place and other resources would call new changes. The first step is creating a S3 bucket manually (optional DB Table) to upload the state-file. This can be done on AWS console due to using Terraform sometimes returns an error such as “S3 name not accepted”.  This website has the following AWS services utilised:

S3 Bucket (optional DB Table)
VPC
Public and private subnets
Elastic IP
Rout tables
NAT Gateway
Internet Gateway
Security groups
Autoscaling group
Network Load-balancer
Application Load-balancer
Ubuntu 20.04
Jump server (Bastion host)
Apache webserver

Requirements:
AWS account
VS Code or IntelliJ
AWS CLI
Tfenv  2.0 or above

Note: Some of the AWS services used in this project are not included in the AWS free tier and incur a charge such as the Elastic IP, etc.

Optional Enhancements:
SSL certificate for HTTPS
Session stickiness
I have used HTTP on the load-balancer listener for test purposes however, HTTPS can be configured to have a more secure connection, but an SSL certificate is needed for it. Session stickiness can be used to remember the user and rout connection to the same resource.
