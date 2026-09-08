# Incident 02 - Website Down

## Incident
The web application hosted on the EC2 instance became unavailable.

## Investigation
1. Verified that the EC2 instance was reachable via SSH.
2. Tested the website locally using `curl http://localhost`.
3. Checked the Nginx service status.
4. Found that the Nginx service was inactive.

## Root Cause
The Nginx service was stopped.

## Resolution
Restarted the Nginx service:

`sudo systemctl start nginx`

Verified the service was running and confirmed the website was accessible again.

## Prevention
Nginx is configured to start automatically during system boot using systemd.