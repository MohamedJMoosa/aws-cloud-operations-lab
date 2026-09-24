# AWS Cloud Operations Lab

A hands-on AWS Cloud Operations project focused on infrastructure, Linux administration, monitoring, troubleshooting, security, and automation.

## Architecture

![AWS Cloud Operations Architecture](architecture/aws-cloud-architecture.png)

The architecture includes a public EC2 web server running Nginx, CloudWatch monitoring, CPU alarms, SNS email notifications, IAM role-based access, and Amazon S3 health report storage.

## AWS Infrastructure

- VPC: `cloud-ops-vpc`
- CIDR: `10.0.0.0/16`
- Public Subnet: `10.0.1.0/24`
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance: `cloud-ops-server`
- Amazon Linux 2023
- Nginx Web Server
- IAM Role
- Amazon S3

## Linux Administration

- SSH access
- Linux users and permissions
- sudo privileges
- Service management using systemd
- Log investigation using journalctl
- Disk monitoring
- Memory monitoring
- Server uptime checks

## Monitoring

Configured AWS CloudWatch monitoring for the EC2 instance.

Monitored metrics include:

- CPU Utilization
- Network In
- Network Out
- EC2 Status Checks

Configured a CloudWatch alarm:

- Alarm: `cloud-ops-high-cpu`
- Threshold: CPU > 70%
- Notification: Amazon SNS Email Alert

## IAM & S3

- Created an EC2 IAM role: `cloud-ops-ec2-role`
- Used IAM roles instead of storing AWS access keys on the server
- Configured S3 access using least-privilege permissions
- Allowed the EC2 instance to upload health reports only to:

```text
s3://cloud-ops-lab-mohamed-2026/health-reports/